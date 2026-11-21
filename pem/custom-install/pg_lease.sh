#!/usr/bin/env bash

pem::ext::custom::pg_lease::latest_ver() {
    pem::tool::pgxn_latest pg_lease
}

pem::ext::custom::pg_lease::install() {
    local version="${1:-$(pem::ext::custom::pg_lease::latest_ver)}"
    local archive="/tmp/pg_lease-${version}.zip"
    local source="/tmp/pg_lease-${version}"

    pem::tool::apt unzip
    pem::tool::curl -o "$archive" \
        "https://api.pgxn.org/dist/pg_lease/${version}/pg_lease-${version}.zip"
    unzip -q "$archive" -d /tmp
    install -m 0644 "${source}/pg_lease.control" "$(pg_config --sharedir)/extension/pg_lease.control"
    install -m 0644 "${source}/sql/pg_lease--${version}.sql" \
        "$(pg_config --sharedir)/extension/pg_lease--${version}.sql"
    rm -rf "$archive" "$source"

    apt-get purge -y --auto-remove unzip
}
