ARG KEYCLOAK_BASE_IMAGE=quay.io/keycloak/keycloak:26.8
FROM ${KEYCLOAK_BASE_IMAGE} AS builder

# Configure build properties
## Database Vendor https://www.keycloak.org/server/db
## Health Check https://www.keycloak.org/observability/health
## Metrics https://www.keycloak.org/observability/configuration-metrics
## User Event Metrics https://www.keycloak.org/observability/event-metrics
## Tracing https://www.keycloak.org/observability/tracing

# Copy build relevant resources
COPY ./providers /opt/keycloak/providers

# Do the Keycloak Build
RUN /opt/keycloak/bin/kc.sh build

# Create the actual image
FROM ${KEYCLOAK_BASE_IMAGE}
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
