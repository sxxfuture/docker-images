#!/usr/bin/env bash

safe_copy() {
	local src="$1"
	local dst="$2"
	if [ ! -f "$src" ]; then return; fi

	if [ ! -d "$(dirname "$dst")" ]; then
		mkdir -p "$(dirname "$dst")"
	fi

	cp "$src" "$dst"
}

safe_copy /config/configuration.yml /usr/src/redmine/config/configuration.yml
safe_copy /config/database.yml /usr/src/redmine/config/database.yml
safe_copy /config/s3.yml /usr/src/redmine/config/s3.yml
safe_copy /config/initializers/saml.rb /usr/src/redmine/config/initializers/saml.rb

/docker-entrypoint.sh "$@"
