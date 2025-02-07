#!/bin/bash

cp ../certs/dhparam.pem ./certs/
cp ../certs/ldap.* ./certs/
cp ../certs/rootCA.crt ./certs/

docker build --pull -t dasniko/openldap_flintstones .
docker buildx build --pull --platform linux/amd64,linux/arm64 -t dasniko/openldap_flintstones . --push
docker image prune -f
