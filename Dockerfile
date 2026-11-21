ARG PG_VERSION=18

FROM debian:13-slim

ARG PG_VERSION
ARG PIG_VERSION=
ARG PGDATA=/var/lib/postgresql/${PG_VERSION%%.*}/docker
ARG DEBIAN_FRONTEND=noninteractive

ENV PG_MAJOR=${PG_VERSION%%.*}
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/postgresql/${PG_MAJOR}/bin \
    LANG=en_US.utf8 \
    PGDATA=${PGDATA}

RUN --mount=type=bind,source=pem,target=/pem \
    --mount=type=cache,id=postgres-apt-cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,id=postgres-apt-lists,target=/var/lib/apt/lists,sharing=locked \
    bash <<'EOF'
set -eux
source /pem/sourceme
pem::init "${PG_VERSION}"
EOF

VOLUME ${PGDATA}

STOPSIGNAL SIGINT
EXPOSE 5432
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]
