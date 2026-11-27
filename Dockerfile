ARG KEYCLOAK_BASE_IMAGE=quay.io/keycloak/keycloak:26.8
FROM ${KEYCLOAK_BASE_IMAGE} AS builder

# Configure build properties
## Database Vendor https://www.keycloak.org/server/db
ENV KC_DB=postgres
## Health Check https://www.keycloak.org/observability/health
ENV KC_HEALTH_ENABLED=true
## Metrics https://www.keycloak.org/observability/configuration-metrics
ENV KC_METRICS_ENABLED=true
## User Event Metrics https://www.keycloak.org/observability/event-metrics
ENV KC_EVENT_METRICS_USER_ENABLED=true
## Tracing https://www.keycloak.org/observability/tracing
#ENV KC_TRACING_ENABLED=true

# Copy build relevant resources
COPY ./providers /opt/keycloak/providers
COPY ./themes /opt/keycloak/themes

# Do the Keycloak Build
RUN /opt/keycloak/bin/kc.sh build

# Create the actual image
FROM ${KEYCLOAK_BASE_IMAGE}
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
