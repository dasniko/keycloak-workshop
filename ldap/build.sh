#!/bin/bash

cp ../certs/dhparam.pem ./certs/
cp ../certs/ldap.* ./certs/
cp ../certs/rootCA.crt ./certs/

docker build --pull -t ghcr.io/dasniko/flintstones_ldap:latest .
docker image prune -f
