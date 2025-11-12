FROM eclipse-temurin:21-jre
LABEL maintainer="Niko Köbler <info@n-k.de>"

RUN apt-get update && \
    apt-get install -y jq uuid-runtime && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL https://github.com/keycloak/keycloak-benchmark/releases/download/999.0.0-SNAPSHOT/keycloak-benchmark-999.0.0-SNAPSHOT.tar.gz \
    | tar -xzC /tmp && \
    mv /tmp/keycloak-benchmark-999.0.0-SNAPSHOT /tmp/benchmark

WORKDIR /tmp/benchmark/bin
