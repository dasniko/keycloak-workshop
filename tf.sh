#!/bin/bash
docker run --rm -v ./terraform:/tmp/tf -v ./certs:/certs -w /tmp/tf --network=keycloak-workshop_default hashicorp/terraform:latest "$@"
