#!/bin/bash
#docker run --rm -v ./terraform:/tmp/tf -v ./certs:/certs -w /tmp/tf -e HTTP_PROXY=http://proxy:3128 -e HTTPS_PROXY=http://proxy:3128 -e NO_PROXY="lb,localhost,127.0.0.0/8" --network=keycloak-workshop hashicorp/terraform:latest "$@"
docker run --rm -v ./terraform:/tmp/tf -v ./certs:/certs -w /tmp/tf --network=keycloak-workshop hashicorp/terraform:latest "$@"
