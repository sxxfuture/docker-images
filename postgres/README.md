# PostgreSQL Docker Images

Custom PostgreSQL images with pgvector and PostGIS extensions pre-installed using [pglayers](https://pglayers.dev).

## Supported Versions

- PostgreSQL 17
- PostgreSQL 18

Note: PostgreSQL 16 is not available because pglayers only provides extensions for PG 17+.

## Extensions

Pre-built extensions from pglayers:
- **pgvector** - Vector similarity search
- **PostGIS** - Geographic objects support

## Building

### CI/CD (GitHub Actions)

Push to `master` branch automatically builds and publishes all three versions to `ghcr.io/sxxfuture/docker-images/postgres:{16,17,18}`.

### Local Testing

**Build single version:**
```bash
cd postgres
docker build --build-arg PG_MAJOR=17 -t postgres-test:17 .
docker build --build-arg PG_MAJOR=18 -t postgres-test:18 .
```

**Test the image:**
```bash
docker run --rm postgres-test:18 psql -U postgres -c "SELECT version();"
docker run --rm postgres-test:18 psql -U postgres -c "CREATE EXTENSION vector;"
docker run --rm postgres-test:18 psql -U postgres -c "CREATE EXTENSION postgis;"
```

## Architecture

Uses multi-stage build to copy pre-compiled extensions from [pglayers](https://pglayers.dev):
- Base: Official `postgres:{version}` image
- Extensions: `ghcr.io/pglayers/pgx-pgvector:{version}` and `ghcr.io/pglayers/pgx-postgis:{version}`

Benefits:
- Fast builds (no compilation)
- Consistent versions across PG versions
- Minimal final image size
- Maintained by pglayers project

## Caching

GitHub Actions uses `type=gha` cache with per-version scopes:
- `postgres-17`
- `postgres-18`

## Tags

Each version gets two tags:
- `postgres:{17,18}` - Latest
- `postgres:{17,18}-{sha}` - Commit-specific

## License

See parent repository.
