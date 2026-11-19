# PostgreSQL Docker Images

Custom PostgreSQL images with pgvector and PostGIS installed from the
[PGDG](https://apt.postgresql.org/) and [Pigsty](https://pigsty.cc/) package
repositories via the [Pig](https://pigsty.cc/docs/pig/) CLI.

## Supported Versions

- PostgreSQL 17
- PostgreSQL 18

## Build Layers

The images are built in three layers:

| Layer | Dockerfile | Base | Purpose |
|-------|------------|------|---------|
| Pig base | `Dockerfile.pig` | `debian:13-slim` | Installs the pinned Pig CLI (`1.11.0`) from `https://repo.pigsty.cc/pig` |
| PostgreSQL 17 | `Dockerfile.17` | `postgres:pig` | Installs PostgreSQL 17 + pgvector + PostGIS |
| PostgreSQL 18 | `Dockerfile.18` | `postgres:pig` | Installs PostgreSQL 18 + pgvector + PostGIS |

The Pig base is deliberately separate so CI builds and pushes it once per
commit, and both PostgreSQL images reuse that same base.

`Dockerfile.17` / `Dockerfile.18` run:

```bash
# postgresql-common from Debian ships the PGDG signing key
apt-get install -y --no-install-recommends postgresql-common
pig repo add pgsql --region=default
# rewrite the PGDG source from trusted=yes to signed-by=...
apt-get update
pig install -v <major> pg<major> vector postgis -y
```

The PGDG source is rewritten to
`signed-by=/usr/local/share/keyrings/postgres.gpg.asc`, using the key shipped by
`postgresql-common`; Pig's default `trusted=yes` for PGDG is not kept.  The
Pigsty source keeps its own signed-by key.  Packages are signature-verified by
the explicit `apt-get update` before installation.

This installs a single PostgreSQL major version plus the extension packages
(`postgresql-<major>-pgvector`, `postgresql-<major>-postgis-3`).  Package
recommends are disabled and the apt lists are cleared in the final image.

The installed versions currently are:

- pgvector `0.8.7`
- PostGIS `3.7.0`

Package versions follow the PGDG/Pigsty repositories and can move independently
of this repository.

## Building Locally

Build the Pig base first, then the PostgreSQL images.  The default
`PIG_IMAGE=postgres:pig` in both Dockerfiles points at the local base image.

```bash
cd postgres

docker build -f Dockerfile.pig -t postgres:pig .

docker build -f Dockerfile.17 -t postgres:17-local .
docker build -f Dockerfile.18 -t postgres:18-local .
```

To use a base image from another registry or tag:

```bash
docker build -f Dockerfile.17 \
  --build-arg PIG_IMAGE=ghcr.io/sxxfuture/docker-images/postgres:pig-<sha> \
  -t postgres:17-local .
```

## Official Image Compatibility

Only the database packages and extensions are installed from Pig/PGDG.  The
container entrypoint behavior is taken from the corresponding official image:

- Multi-stage build uses `postgres:<major>-trixie` as `official` and copies
  `/usr/local/bin/` verbatim, including `docker-entrypoint.sh`,
  `docker-ensure-initdb.sh`, `docker-enforce-initdb.sh`, and `gosu`.
- `postgres` runs as UID/GID `999`.
- `/var/lib/postgresql` is `1777`, `/run/postgresql` is `3777`, and
  `/usr/local/lib/tmpfiles.d/postgresql-common.conf` records both.
- `postgresql-common` is installed before the server package and
  `create_main_cluster` is disabled, so no default cluster is shipped.
- Runtime dependencies (`locales`/`en_US.utf8`, `libnss-wrapper`, `less`,
  `xz-utils`, `zstd`) are installed, matching the official image.
- The sample config has `listen_addresses = '*'`.
- `PATH` includes `/usr/lib/postgresql/<major>/bin`,
  `/docker-entrypoint-initdb.d` exists, and `STOPSIGNAL SIGINT`, `EXPOSE 5432`,
  `ENTRYPOINT ["docker-entrypoint.sh"]`, `CMD ["postgres"]` are set.

The images use the classic PostgreSQL layout: extensions live in the standard
`/usr/lib/postgresql/<major>/lib` and
`/usr/share/postgresql/<major>/extension` paths.  No
`extension_control_path` or `dynamic_library_path` override is needed or set.

The official `PG_VERSION` environment variable is intentionally not set: the
exact package version is chosen by the package repository at build time, so
hard-coding it would risk disagreeing with the actual installed server.  Use
`postgres --version` to inspect the installed version.

### Version Differences

The `PGDATA` location and volume mount point differ between PostgreSQL 17 and
18, matching the official images:

| Version | `PGDATA` | `VOLUME` | Build-time PGDATA |
|---------|----------|----------|-------------------|
| 17 | `/var/lib/postgresql/data` | `/var/lib/postgresql/data` | Created with mode `1777` |
| 18 | `/var/lib/postgresql/18/docker` | `/var/lib/postgresql` | Not created; the entrypoint creates it |

For PostgreSQL 18, mount a volume at `/var/lib/postgresql` (not
`/var/lib/postgresql/data`) so `pg_upgrade --link` can work across version
subdirectories.

PostgreSQL 18 also installs `postgresql-18-jit` when the repository provides
it, matching the official image's optional JIT package.

## Testing an Image

```bash
docker run -d --name pg-test \
  -e POSTGRES_USER=testuser \
  -e POSTGRES_PASSWORD=testpass \
  -e POSTGRES_DB=testdb \
  postgres:18-local

# wait until it accepts connections, then:
docker exec -e PGPASSWORD=testpass pg-test \
  psql -U testuser -d testdb -c "CREATE EXTENSION vector; CREATE EXTENSION postgis;"
docker exec -e PGPASSWORD=testpass pg-test \
  psql -U testuser -d testdb -c "SELECT '[1,2,3]'::vector <-> '[4,5,6]'::vector;"
docker exec -e PGPASSWORD=testpass pg-test \
  psql -U testuser -d testdb -c "SELECT postgis_version();"
docker exec pg-test pg_dump --version

docker rm -f pg-test
```

## CI/CD

GitHub Actions (`.github/workflows/postgres.yml`) builds on pushes to `master`:

1. `build-pig` builds and pushes the Pig base to GHCR as
   `postgres:pig` and `postgres:pig-<sha>`.
2. `build-images` depends on `build-pig` and builds the 17/18 matrix with
   `PIG_IMAGE=ghcr.io/<repository>/postgres:pig-<sha>`, so every PostgreSQL
   image uses the base produced by the same commit.

Both jobs build `linux/amd64` and use `type=gha` caching.

## Tags

Each PostgreSQL version gets two tags:

- `postgres:{17,18}` - latest build for that major version
- `postgres:{17,18}-{sha}` - commit-specific build

The Pig base gets `postgres:pig` and `postgres:pig-{sha}`.

## License

See parent repository.
