# Context

| Term | Meaning |
|------|---------|
| PEM | Build-time shell library rooted at `/pem`, loaded by `pem/sourceme`. |
| Extension spec | `<alias>` or `<alias>=<version>`, for example `vector=0.8.7` or `pg_lease`. |
| Builder image | `debian:13-slim` carrying only `/pem`; no Pig or PostgreSQL. |
| Core image | PostgreSQL and the official Docker entrypoint, without extensions. |
| Ext image | Core image plus the default or user-supplied extension specs. |
| PGDATA | PostgreSQL data directory; `/var/lib/postgresql/<major>/docker`, except PostgreSQL 17 at `/var/lib/postgresql/data`. |
| Preload | `shared_preload_libraries` entries required by an extension before `CREATE EXTENSION`. |
