#!/usr/bin/env bash
set -Eeuo pipefail

required_vars=(
	REDMINE_URL
	SECRET_KEY_BASE
	REDMINE_DB_URL
	REDMINE_S3_BUCKET
	REDMINE_S3_REGION
	REDMINE_S3_ACCESS_KEY_ID
	REDMINE_S3_SECRET_ACCESS_KEY
	REDMINE_OIDC_SITE
	REDMINE_OIDC_REALM
	REDMINE_OIDC_CLIENT_ID
	REDMINE_OIDC_CLIENT_SECRET
)

missing_vars=()
for name in "${required_vars[@]}"; do
	if [[ -z "${!name:-}" ]]; then
		missing_vars+=("$name")
	fi
done

if (( ${#missing_vars[@]} > 0 )); then
	printf 'error: missing required environment variables: %s\n' "${missing_vars[*]}" >&2
	exit 1
fi

export REDMINE_S3_ENDPOINT="${REDMINE_S3_ENDPOINT:-}"
export REDMINE_OIDC_NAME="${REDMINE_OIDC_NAME:-Keycloak}"

case "${REDMINE_OIDC_AUTO_REGISTER:-false}" in
	true | false)
		export REDMINE_OIDC_AUTO_REGISTER="${REDMINE_OIDC_AUTO_REGISTER:-false}"
		;;
	*)
		echo 'error: REDMINE_OIDC_AUTO_REGISTER must be "true" or "false"' >&2
		exit 1
		;;
esac

if ! ruby -ruri -e '
	uri = URI.parse(ENV.fetch("REDMINE_URL"))
	exit 1 unless %w[http https].include?(uri.scheme)
	exit 1 if uri.host.to_s.empty?
	exit 1 unless ["", "/"].include?(uri.path.to_s)
' 2>/dev/null; then
	echo 'error: REDMINE_URL must be an absolute http(s) URL without a path' >&2
	exit 1
fi

case "${REDMINE_DB_URL}" in
	postgres://* | postgresql://*) ;;
	*)
		echo 'error: REDMINE_DB_URL must use the postgres:// or postgresql:// scheme' >&2
		exit 1
		;;
esac

config_dir=/usr/src/redmine/config
umask 077

cat > "${config_dir}/database.yml" <<'YAML'
production:
  adapter: postgresql
  url: <%= ENV.fetch("REDMINE_DB_URL") %>
YAML

cat > "${config_dir}/s3.yml" <<'YAML'
<% require "json" %>
production:
  access_key_id: <%= ENV.fetch("REDMINE_S3_ACCESS_KEY_ID").to_json %>
  secret_access_key: <%= ENV.fetch("REDMINE_S3_SECRET_ACCESS_KEY").to_json %>
  bucket: <%= ENV.fetch("REDMINE_S3_BUCKET").to_json %>
  folder: ""
  endpoint: <%= ENV.fetch("REDMINE_S3_ENDPOINT", "").to_json %>
  thumb_folder: ""
  import_folder: ""
  region: <%= ENV.fetch("REDMINE_S3_REGION").to_json %>
YAML

chmod 0644 "${config_dir}/database.yml" "${config_dir}/s3.yml"

echo "Starting Redmine: /docker-entrypoint.sh $*"

exec /docker-entrypoint.sh "$@"
