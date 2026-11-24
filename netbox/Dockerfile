# syntax=docker/dockerfile:1
FROM netboxcommunity/netbox:v4.7.5

LABEL org.opencontainers.image.source=https://github.com/sxxfuture/docker-images

WORKDIR /opt/netbox/netbox

COPY --link configuration.py extra.py /etc/netbox/config/
COPY --link sso_pipeline_sync_keycloak.py /opt/netbox/netbox/netbox/sso_pipeline_sync_keycloak.py

USER 999:0
