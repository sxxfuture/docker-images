# PostgreSQL Images

PostgreSQL 17/18 from Debian 13 with the official Docker entrypoint and a
selected extension set installed through [Pig](https://pigsty.cc/docs/pig/).

## Layout

```text
Dockerfile.builder   # debian:13-slim + /pem only
Dockerfile           # core: PostgreSQL, no extensions
Dockerfile.ext       # PostgreSQL + default extension set
pem/                 # build-time shell library, bind-mounted at /pem
test/                # extension tests, bind-mounted at /test
```

`pem/sourceme` sources every `pem/**/*.sh`. No script installs anything at
source time; `pem::init` is the only entrypoint.

## PEM API

| Function | Purpose |
|----------|---------|
| `pem::init [pg_version=18] [ext[=version]]...` | Install Pig, PostgreSQL, then each extension |
| `pem::install::pig [pig_version]` | Install the Pig CLI; empty selects the latest stable |
| `pem::install::postgres [pg_version]` | Install PostgreSQL and official entrypoint files |
| `pem::pig::latest_ver` | Latest stable Pig CLI version |
| `pem::pig::install <ext[=version]>` | Install one Pig extension package |
| `pem::ext::install <ext[=version]>` | Install a custom extension when defined, otherwise Pig |
| `pem::ext::pre_install` / `pem::ext::post_install` | Global hooks, once per build |
| `pem::ext::custom::<ext>::{pre_install,install,post_install,latest_ver}` | Custom extension hooks |

`pg_lease` is the only custom extension. It installs the control and SQL files
from PGXN without a pinned checksum. Its version defaults to the newest stable
PGXN release, falling back to the newest testing release when no stable release
exists (currently `0.1.0`).

## Versions

Current builds install PostgreSQL 17.12 and 18.7.

`PG_VERSION` accepts a major (`18`), a minor (`18.7`), or a full Debian version
(`18.7-1.pgdg13+5`). A major-only value installs the repository default through
`pig install pg18`; other values install `pg18=<version>`, using Pig's package
version prefix matching.

The default extension specs in `Dockerfile.ext` are package versions:

```text
vector=0.8.7 postgis=3.7.0 vchord=1.3.0 pgvectorscale=0.9.1
pg_cron=1.6.8 pg_vectorize=0.27.1 hashtypes=0.1.5 pg_search=0.26.6
pg_tokenizer=1.1.0 pgmq=1.13.1 pg_uuidv7=1.7.0 pg_lease=0.1.0
```

Aliases map to Pig packages where the names differ: `pgvectorscale` →
`vectorscale`, `pg_vectorize` → `vectorize`. Override the whole set with
`--build-arg EXTENSIONS="vector postgis pg_lease"`.

Package and SQL extension versions are not always equal: `pg_cron` 1.6.8
provides SQL 1.6, `pg_vectorize` 0.27.1 provides SQL 0.23.0, and `pg_uuidv7`
1.7.0 provides SQL 1.7.

## Build

Build from this directory. The PEM scripts are bind-mounted, so BuildKit is
required. Use a proxy build argument when the build host needs one; it is not
written into the image.

```bash
docker build -f Dockerfile.builder -t postgres-builder:latest .

docker build -f Dockerfile -t postgres:18-core .
docker build -f Dockerfile.ext -t postgres:18 .

docker build -f Dockerfile -t postgres:17-core \
  --build-arg PG_VERSION=17 \
  --build-arg PGDATA=/var/lib/postgresql/data .
docker build -f Dockerfile.ext -t postgres:17 \
  --build-arg PG_VERSION=17 \
  --build-arg PGDATA=/var/lib/postgresql/data .
```

When called outside the Dockerfiles, `pem::install::postgres` prepends
`/usr/lib/postgresql/<major>/bin` to `PATH` and, if `PGDATA` is unset, defaults
it to `/var/lib/postgresql/<major>/docker`, except PostgreSQL 17 which uses
`/var/lib/postgresql/data`. The Dockerfiles pass `PGDATA` explicitly for 17.
`PIG_VERSION` may be empty (latest stable) or pinned, for example
`--build-arg PIG_VERSION=1.11.0`.

The apt cache mounts use fixed IDs with `sharing=locked`; apt lists are kept
inside the mounts. CI also uses `type=gha` layer caches because cache mounts do
not persist across GitHub runners.

## Test

Start a temporary server and run all extension SQL tests:

```bash
docker run --rm \
  -e POSTGRES_HOST_AUTH_METHOD=trust \
  -v "$PWD/test:/test:ro" \
  --entrypoint bash \
  postgres:18 \
  -c 'source /test/sourceme && pem::test::init && for ext in pgvector postgis vchord pgvectorscale pg_cron pg_vectorize hashtypes pg_lease pg_search pg_tokenizer pgmq pg_uuidv7; do pem::test "$ext"; done'
```

`pem::test::init` starts `docker-entrypoint.sh` in the background with
`shared_preload_libraries=vchord,pg_cron,vectorize,pg_search,pg_tokenizer`,
`cron.database_name=postgres`, and `vectorize.database_name=postgres`.
`pem::test <name>` runs `/test/<name>.sh` when present, otherwise
`/test/<name>.sql` through `psql -v ON_ERROR_STOP=1`. Any failure is non-zero.

`pg_vectorize` is tested offline: dependencies, `vectorize.job`, and API
registration only. No embedding provider is contacted.

## Preload

These extensions need server preloading:

```text
shared_preload_libraries=vchord,pg_cron,vectorize,pg_search,pg_tokenizer
cron.database_name=postgres
vectorize.database_name=postgres
```

The image does not set them in the sample config. Pass them at `docker run`, as
in the test command above. `vector`, `postgis`, `vectorscale`, `pgmq`,
`hashtypes`, `pg_lease`, and `pg_uuidv7` do not require preloading.

## Tags and CI

`.github/workflows/postgres.yml` builds `linux/amd64` images for PostgreSQL
17/18, tests them, and pushes on non-PR events:

| Image | Tag |
|-------|-----|
| builder | `ghcr.io/<owner>/<repo>/postgres-builder:latest` |
| core | `ghcr.io/<owner>/<repo>/postgres:<major>-core` |
| ext | `ghcr.io/<owner>/<repo>/postgres:<major>` |

Pull requests build and test without pushing.
