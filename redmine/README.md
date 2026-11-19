# Redmine

Redmine 7.0.3 with PostgreSQL, S3 attachments, and OIDC login (Keycloak).

Runtime configuration is entirely environment based. The container generates
`config/database.yml` and `config/s3.yml` on startup; database, S3, and SAML/OIDC
config files must not be mounted into the container.

## Required environment variables

| Name | Description |
| --- | --- |
| `REDMINE_URL` | External base URL, for example `https://redmine.example.com`. Must be an absolute `http` or `https` URL without a path. The scheme and host are persisted as Redmine's `protocol` and `host_name`. `http` is intended for local testing only; use `https` in production. |
| `SECRET_KEY_BASE` | Rails secret. Use a long random value and keep it stable across restarts. |
| `REDMINE_DB_URL` | PostgreSQL DSN, for example `postgresql://redmine:password@postgres:5432/redmine`. |
| `REDMINE_S3_BUCKET` | Attachment bucket. |
| `REDMINE_S3_REGION` | Bucket region. |
| `REDMINE_S3_ACCESS_KEY_ID` | S3 access key ID. |
| `REDMINE_S3_SECRET_ACCESS_KEY` | S3 secret access key. |
| `REDMINE_OIDC_SITE` | Keycloak base URL, without a path, for example `https://keycloak.example.com`. |
| `REDMINE_OIDC_REALM` | Keycloak realm name. |
| `REDMINE_OIDC_CLIENT_ID` | OIDC client ID. |
| `REDMINE_OIDC_CLIENT_SECRET` | OIDC client secret. |

## Optional environment variables

| Name | Default | Description |
| --- | --- | --- |
| `REDMINE_S3_ENDPOINT` | empty | Custom S3-compatible endpoint. Leave empty for AWS S3. |
| `REDMINE_OIDC_NAME` | `Keycloak` | Login button and provider display name. |
| `REDMINE_OIDC_AUTO_REGISTER` | `false` | `false` disables OIDC self-registration. `true` automatically activates unknown users. Existing local passwords remain usable. |
| `REDMINE_PLUGINS_MIGRATE` | empty | Set to any non-empty value to run Redmine plugin migrations during container startup. Required once after upgrading the image or adding the OIDC plugin. |

## OIDC

Register the Redmine callback URL in Keycloak:

```text
${REDMINE_URL}/oauth2callback
```

The single provider is managed in the database on Rails boot. The initializer
creates or updates the `Keycloak` provider with:

- user identification by immutable OIDC `sub` (`uid`)
- automatic linking of an existing Redmine user by verified email
- local password login preserved
- role synchronization and automatic profile updates disabled
- self-registration controlled by `REDMINE_OIDC_AUTO_REGISTER`

If the OAuth tables do not exist yet, the initializer skips provider setup. Set
`REDMINE_PLUGINS_MIGRATE=true` and restart the container once; the server process
then completes the provider and Redmine host/protocol settings.

## Database DSN

Special characters in the PostgreSQL user name or password must be URL encoded
inside `REDMINE_DB_URL`. For example, password `p@ss:w/rd` becomes
`p%40ss%3Aw%2Frd`:

```text
postgresql://redmine:p%40ss%3Aw%2Frd@postgres:5432/redmine
```

The DSN is not split by the entrypoint and is not written into `database.yml`.
Rails reads it directly from `REDMINE_DB_URL`.

## Legacy configuration mounts

Mounting `database.yml`, `s3.yml`, or a SAML initializer is no longer supported.
These settings now come from environment variables.
