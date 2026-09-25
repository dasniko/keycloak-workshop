#!/bin/bash
docker run --rm -p 8090:80 -e PHPLDAPADMIN_LDAP_HOSTS=ldap -e PHPLDAPADMIN_HTTPS=false --network=keycloak-workshop osixia/phpldapadmin:latest --loglevel warning
