FROM eclipse-temurin:21-jre
LABEL maintainer="Niko Köbler <info@n-k.de>"

RUN apt-get update && \
    apt-get install -y jq uuid-runtime && \
    curl -sL https://github.com/keycloak/keycloak-benchmark/releases/download/999.0.0-SNAPSHOT/keycloak-benchmark-999.0.0-SNAPSHOT.tar.gz \
    | tar -xzC /tmp && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/keycloak-benchmark-999.0.0-SNAPSHOT/bin