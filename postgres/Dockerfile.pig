# Pig CLI base image for the PostgreSQL images.
#
# Pig is only used at build time by Dockerfile.17 / Dockerfile.18 to add the
# PGDG + Pigsty repositories and install PostgreSQL with extensions.  Keeping
# it in its own image means CI builds those repositories only once per commit.
FROM debian:13-slim

ARG PIG_VERSION=1.11.0
ARG DEBIAN_FRONTEND=noninteractive

ENV LANG=C.UTF-8

RUN <<EOF
set -eux
apt-get update
apt-get install -y --no-install-recommends ca-certificates curl gnupg
curl -fsSL https://repo.pigsty.cc/pig | bash -s "${PIG_VERSION}"
pig version
rm -rf /var/lib/apt/lists/* /tmp/pig_*.deb
EOF

CMD ["bash"]
