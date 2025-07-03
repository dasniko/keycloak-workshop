ARG KEYCLOAK_BASE_IMAGE=quay.io/keycloak/keycloak:26.3
FROM ${KEYCLOAK_BASE_IMAGE} AS builder

# Configure build properties
ENV KC_DB=postgres
# tbc...

# Copy build relevant resources
COPY ./certs /opt/keycloak/certs
COPY ./providers /opt/keycloak/providers
COPY ./themes /opt/keycloak/themes

# Do the Keycloak Build
RUN /opt/keycloak/bin/kc.sh build

# Create the actual image
FROM ${KEYCLOAK_BASE_IMAGE}
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
