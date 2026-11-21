#!/usr/bin/env bash

pem::pig::latest_ver() {
    pem::tool::curl https://repo.pigsty.cc/pkg/pig/latest
}

pem::pig::install() {
    local spec="$1" name="${1%%=*}" package
    case "$name" in
        pgvectorscale) package=vectorscale ;;
        pg_vectorize) package=vectorize ;;
        *) package="$name" ;;
    esac
    pig install -v "$PG_MAJOR" "${package}${spec#"$name"}" -y
}

pem::install::pig() {
    apt-get -o Acquire::Retries=5 update
    pem::tool::apt ca-certificates curl gnupg

    local version="${1:-${PIG_VERSION:-}}"
    [[ -n "$version" ]] || version="$(pem::pig::latest_ver)"

    pem::tool::curl https://repo.pigsty.cc/pig | bash -s "$version"
    pig version
    rm -f /tmp/pig_*.deb
}

pem::install::postgres() {
    PG_VERSION="${1:-18}"
    PG_MAJOR="${PG_VERSION%%.*}"
    if [[ -z "${PGDATA:-}" ]]; then
        if [[ "$PG_MAJOR" == 17 ]]; then
            PGDATA=/var/lib/postgresql/data
        else
            PGDATA="/var/lib/postgresql/${PG_MAJOR}/docker"
        fi
    fi
    PATH="/usr/lib/postgresql/${PG_MAJOR}/bin:${PATH}"
    export PG_VERSION PG_MAJOR PGDATA PATH

    groupadd -r postgres --gid=999
    useradd -r -g postgres --uid=999 --home-dir=/var/lib/postgresql --shell=/bin/bash postgres
    install --verbose --directory --owner postgres --group postgres --mode 1777 /var/lib/postgresql
    install --verbose --directory --owner postgres --group postgres --mode 3777 /run/postgresql
    mkdir -p /usr/local/lib/tmpfiles.d
    printf '%s\n' \
        'd /var/lib/postgresql 1777 postgres postgres' \
        'd /run/postgresql 3777 postgres postgres' \
        > /usr/local/lib/tmpfiles.d/postgresql-common.conf

    rm -f /etc/apt/apt.conf.d/docker-clean
    printf '%s\n' \
        'APT::Install-Recommends "false";' \
        'APT::Install-Suggests "false";' \
        'APT::Keep-Downloaded-Packages "true";' \
        'Dpkg::Options { "--force-confold"; };' \
        > /etc/apt/apt.conf.d/99pem

    if [ -f /etc/dpkg/dpkg.cfg.d/docker ]; then
        grep -q '/usr/share/locale' /etc/dpkg/dpkg.cfg.d/docker
        sed -ri '/\/usr\/share\/locale/d' /etc/dpkg/dpkg.cfg.d/docker
        ! grep -q '/usr/share/locale' /etc/dpkg/dpkg.cfg.d/docker
    fi

    apt-get -o Acquire::Retries=5 update
    pem::tool::apt locales libnss-wrapper less xz-utils zstd gosu
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
    locale-gen
    locale -a | grep 'en_US.utf8'

    # postgresql-common from Debian ships the PGDG signing key.
    pem::tool::apt postgresql-common
    sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf
    install -D -m 0644 /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc \
        /usr/local/share/keyrings/postgres.gpg.asc

    # Pig writes PGDG as trusted=yes; verify it with the Debian-provided key.
    pig repo add pgsql --region=default
    sed -ri 's#^deb \[[^]]*\] (http://apt\.postgresql\.org/pub/repos/apt/)#deb [signed-by=/usr/local/share/keyrings/postgres.gpg.asc] \1#' \
        /etc/apt/sources.list.d/pgsql.list
    ! grep -Eq '^deb .*apt\.postgresql\.org.*trusted=yes' /etc/apt/sources.list.d/pgsql.list
    grep -F 'signed-by=/usr/local/share/keyrings/postgres.gpg.asc' /etc/apt/sources.list.d/pgsql.list
    apt-get -o Acquire::Retries=5 update
    pem::tool::apt postgresql-common
    sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf

    local pg_pin="" jit_pin=""
    if [[ "$PG_VERSION" != "$PG_MAJOR" ]]; then
        pg_pin="=${PG_VERSION}"
        jit_pin="=${PG_VERSION}*"
    fi
    pig install -v "$PG_MAJOR" "pg${PG_MAJOR}${pg_pin}" -y
    if apt-cache show "postgresql-${PG_MAJOR}-jit" > /dev/null 2>&1; then
        pem::tool::apt "postgresql-${PG_MAJOR}-jit${jit_pin}"
    fi
    test -z "$(pg_lsclusters --no-header)"

    dpkg-divert --add --rename --divert "/usr/share/postgresql/postgresql.conf.sample.dpkg" \
        "/usr/share/postgresql/${PG_MAJOR}/postgresql.conf.sample"
    cp -v /usr/share/postgresql/postgresql.conf.sample.dpkg /usr/share/postgresql/postgresql.conf.sample
    ln -sv ../postgresql.conf.sample "/usr/share/postgresql/${PG_MAJOR}/"
    sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" /usr/share/postgresql/postgresql.conf.sample
    grep -F "listen_addresses = '*'" /usr/share/postgresql/postgresql.conf.sample

    mkdir -p /docker-entrypoint-initdb.d
    if [[ "$PG_MAJOR" == 17 ]]; then
        install --verbose --directory --owner postgres --group postgres --mode 1777 "${PGDATA}"
    fi

    local entrypoint_base="https://raw.githubusercontent.com/docker-library/postgres/31f4af9d429410ba4ad1f6e394daecd9ae7edfa7/18/trixie"
    pem::tool::curl -o /usr/local/bin/docker-entrypoint.sh "${entrypoint_base}/docker-entrypoint.sh"
    pem::tool::curl -o /usr/local/bin/docker-ensure-initdb.sh "${entrypoint_base}/docker-ensure-initdb.sh"
    chmod +x /usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-ensure-initdb.sh
    (
        cd /usr/local/bin
        ln -sT docker-ensure-initdb.sh docker-enforce-initdb.sh
    )

    postgres --version
}

pem::ext::pre_install() {
    :
}

pem::ext::post_install() {
    apt-get purge -y --auto-remove postgresql-common-dev
    test -z "$(pg_lsclusters --no-header)"
}

pem::ext::install() {
    local spec="$1" name="${1%%=*}" version=""
    [[ "$spec" == *=* ]] && version="${spec#*=}"

    local hook="pem::ext::custom::${name}::install"
    if declare -F "$hook" > /dev/null; then
        "$hook" "$version"
    else
        pem::pig::install "$spec"
    fi
}

pem::init() {
    local pg_version="${1:-18}"
    shift || true

    pem::install::pig
    pem::install::postgres "$pg_version"

    pem::ext::pre_install
    local spec name version hook
    for spec in "$@"; do
        name="${spec%%=*}"
        version=""
        [[ "$spec" == *=* ]] && version="${spec#*=}"

        hook="pem::ext::custom::${name}::pre_install"
        declare -F "$hook" > /dev/null && "$hook" "$version"

        pem::ext::install "$spec"

        hook="pem::ext::custom::${name}::post_install"
        declare -F "$hook" > /dev/null && "$hook" "$version"
    done
    pem::ext::post_install
}
