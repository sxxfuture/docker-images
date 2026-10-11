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

## Layout

pglayers publishes extensions in two different layouts depending on the PostgreSQL major version:

| Version | Layout | Dockerfile |
|---------|--------|------------|
| 17 | **Classic** - files at standard paths (`/usr/lib/postgresql/17/lib/`, `/usr/share/postgresql/17/extension/`) | `Dockerfile.17` |
| 18 | **Isolated** - each extension in `/extensions/<name>/`, discovered via `extension_control_path` + `dynamic_library_path` GUCs | `Dockerfile.18` |

The base image is pinned to `postgres:<version>-trixie` because pglayers extensions are built against Debian trixie (glibc 2.38+). The default `postgres:17` is bookworm (glibc 2.36) and fails to load extensions with `GLIBC_2.38 not found`.

## Building

### CI/CD (GitHub Actions)

Push to `master` branch automatically builds and publishes both versions to `ghcr.io/sxxfuture/docker-images/postgres:{17,18}`.

### Local Testing

```bash
cd postgres
docker build -f Dockerfile.17 -t postgres-test:17 .
docker build -f Dockerfile.18 -t postgres-test:18 .
```

**Test the image:**

```bash
docker run -d --name pg-test -e POSTGRES_HOST_AUTH_METHOD=trust postgres-test:18
# wait for readiness, then:
docker exec pg-test psql -U postgres -c "CREATE EXTENSION vector;"
docker exec pg-test psql -U postgres -c "CREATE EXTENSION postgis;"
docker exec pg-test psql -U postgres -c "SELECT extname, extversion FROM pg_extension WHERE extname IN ('vector','postgis');"
docker rm -f pg-test
```

## Architecture

Uses multi-stage `COPY --from` to copy pre-compiled extensions from [pglayers](https://pglayers.dev) onto the official `postgres:{version}-trixie` image.

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
