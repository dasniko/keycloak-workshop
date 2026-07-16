ARG KEYCLOAK_BASE_IMAGE=quay.io/keycloak/keycloak:26.7
FROM ${KEYCLOAK_BASE_IMAGE} AS builder

# Configure build properties
# tbc...

# Copy build relevant resources
COPY ./providers /opt/keycloak/providers

# Do the Keycloak Build
RUN /opt/keycloak/bin/kc.sh build

# Create the actual image
FROM ${KEYCLOAK_BASE_IMAGE}
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
