#!/usr/bin/env bash

pem::tool::apt() {
    apt-get -o Acquire::Retries=5 install -y --no-install-recommends "$@"
}

pem::tool::curl() {
    curl -fsSL --retry 3 --retry-delay 2 "$@"
}

# Newest stable PGXN release, falling back to the newest testing release.
pem::tool::pgxn_latest() {
    local package="$1" metadata version
    metadata="$(pem::tool::curl "https://api.pgxn.org/dist/${package}.json")"

    version="$(printf '%s\n' "$metadata" |
        sed -n '/"stable"[[:space:]]*:[[:space:]]*\[/,/]/p' |
        sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' |
        head -1)"
    if [[ -z "$version" ]]; then
        version="$(printf '%s\n' "$metadata" |
            sed -n '/"testing"[[:space:]]*:[[:space:]]*\[/,/]/p' |
            sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' |
            head -1)"
    fi

    [[ -n "$version" ]] || return 1
    printf '%s\n' "$version"
}
