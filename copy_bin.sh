#!/bin/bash
KC_VERSION=26.1
KCB_VERSION=0.15-SNAPSHOT
docker cp $(docker create --name tmp quay.io/keycloak/keycloak:$KC_VERSION):/opt/keycloak/bin/ . && docker rm tmp
curl -L -O https://github.com/keycloak/keycloak-benchmark/releases/download/$KCB_VERSION/keycloak-benchmark-$KCB_VERSION.tar.gz
tar -xvzf keycloak-benchmark-$KCB_VERSION.tar.gz
rm keycloak-benchmark-$KCB_VERSION.tar.gz
mv keycloak-benchmark-$KCB_VERSION keycloak-benchmark
