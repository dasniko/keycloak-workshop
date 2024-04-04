# Keycloak Workshop by @dasniko

## Voraussetzungen

* Texteditor (Notepad++, VS Code, etc.)
* [Docker](https://www.docker.com/) und [Docker Compose](https://docs.docker.com/compose/) installiert und lauffähig (ggf. lokale Admin-Rechte auf dem Rechner erteilen)
* Internetzugriff (ggf. Proxy-/Firewall-/VPN-Konfigurationen etc. überprüfen)
* Browser

## Docker Images

Folgende Docker Images werden im Workshop verwendet und können bereits vor dem Workshop mit den folgenden Befehlen runtergeladen werden:

```
docker pull quay.io/keycloak/keycloak:23.0
docker pull postgres:15
docker pull nginx:alpine
docker pull axllent/mailpit:latest
docker pull osixia/openldap:latest
docker pull osixia/phpldapadmin:latest
docker pull dasniko/bookshop:0.0.4
```

## Download Workshop-Material

https://github.com/dasniko/keycloak-workshop/archive/refs/heads/main.zip

## Folien & Beispiele

OAuth2, OIDC & JWT Basics:
https://speakerdeck.com/dasniko/oauth2-oidc-and-jwt-important-basics

Bookshop (Verteilte Anwendung, Basis Quarkus, Sprint Boot & React.JS):
https://github.com/dasniko/keycloak-bookshop-demo

## Weitere Links

### Allgemeine Beispiele, Erweiterungen & Links

* Niko's YouTube Kanal:
https://www.youtube.com/@dasniko
* Niko's GitHub Profil:
https://github.com/dasniko
* Keycloak Extensions Beispiele:
https://github.com/dasniko/keycloak-extensions-demo
* Testcontainer-Keycloak Projekt:
https://github.com/dasniko/testcontainers-keycloak
* Moderator @ Keycloak Discourse Forum:
https://keycloak.discourse.group/

### Mitigating Security Threats

https://www.keycloak.org/docs/latest/server_admin/index.html#mitigating-security-threats

### Cluster-/Infinispan-Docs

Infinispan Docs:
https://infinispan.org/docs/14.0.x/

Embedded Infinispan / Cluster Transports:
https://infinispan.org/docs/14.0.x/titles/embedding/embedding.html#cluster-transport

JGroups Discovery Protocols:
http://jgroups.org/manual5/index.html#DiscoveryProtocols
