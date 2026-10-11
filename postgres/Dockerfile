ARG PG_MAJOR=17

FROM ghcr.io/pglayers/pgx-pgvector:${PG_MAJOR} AS pgvector
FROM ghcr.io/pglayers/pgx-postgis:${PG_MAJOR} AS postgis
FROM postgres:${PG_MAJOR}-trixie

# Copy pre-built extensions from pglayers
COPY --from=pgvector / /
COPY --from=postgis / /
