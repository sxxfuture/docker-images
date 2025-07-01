FROM quay.io/keycloak/keycloak:26.2.5-0 AS builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

ENV KC_DB=postgres

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build --features=docker

FROM quay.io/keycloak/keycloak:26.2.5-0
COPY --from=builder /opt/keycloak/ /opt/keycloak/

COPY ./healthcheck.java /opt/keycloak/
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=20 CMD ["java", "/opt/keycloak/healthcheck.java"]

# https://www.keycloak.org/docs/latest/upgrading/index.html#the-deprecated-auto-build-cli-option-was-removed
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
