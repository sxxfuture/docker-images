#!/usr/bin/env bash

safe_copy() {
	local src="$1"
	local dst="$2"
	if [ ! -f "$src" ]; then return; fi

	echo "Copying $src to $dst"

	if [ ! -d "$(dirname "$dst")" ]; then
		mkdir -p "$(dirname "$dst")"
	fi

	cp "$src" "$dst"
}

for file in $(find /config -type f); do
	safe_copy "$file" "/usr/src/redmine$file"
done

echo "Starting Redmine: /docker-entrypoint.sh" "$@"

exec /docker-entrypoint.sh "$@"
