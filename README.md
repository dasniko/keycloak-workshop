# Keycloak Workshop by @dasniko

## Voraussetzungen

* Texteditor (Notepad++, VS Code, etc.)
* [Docker](https://www.docker.com/) und [Docker Compose](https://docs.docker.com/compose/) installiert und lauffähig (ggf. lokale Admin-Rechte auf dem Rechner erteilen)
* Internetzugriff (ggf. Proxy-/Firewall-/VPN-Konfigurationen etc. überprüfen)
* Browser
* HTTP-Client (z.B. [Postman](https://www.postman.com/), [Insomnia](https://insomnia.rest/), [REST CLient for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=humao.rest-client), o.ä.)

## Docker Images

Folgende Docker Images werden im Workshop verwendet und können bereits vor dem Workshop mit den folgenden Befehlen runtergeladen werden:

```
docker pull quay.io/keycloak/keycloak:23.0
docker pull postgres:15
docker pull nginx:alpine
docker pull mailhog/mailhog:latest
docker pull osixia/openldap:latest
docker pull osixia/phpldapadmin:latest
docker pull dasniko/bookshop:0.0.3
```

## Download Workshop-Material

https://github.com/dasniko/keycloak-workshop/archive/refs/heads/main.zip

## Allgemeine Beispiele

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

## Workshop-Links

### Securing Applications

OAuth2, OIDC & JWT Basics Präsentation:
https://speakerdeck.com/dasniko/oauth2-oidc-and-jwt-important-basics

Bookshop (Verteilte Anwendung, Basis Quarkus & React.JS):
https://github.com/dasniko/keycloak-bookshop-demo

### Themeing

https://www.keycloak.org/docs/latest/server_development/index.html#_themes

### Identity Providers & User Federation

#### User Storage  SPI (Federation)

Flintstones:
https://github.com/dasniko/keycloak-extensions-demo/tree/main/flintstones-userprovider

#### Externe IdPs

Azure AD:
https://www.youtube.com/watch?v=LYF-NLHD2uQ

### Authentication Flows, Custom Authenticators & Required Actions

MagicLink Authenticator:
https://github.com/dasniko/keycloak-extensions-demo/tree/main/magiclink

MFA Authenticator:
https://github.com/dasniko/keycloak-extensions-demo/tree/main/mfa-authenticator

Mobile Number Required Action:
https://github.com/dasniko/keycloak-extensions-demo/tree/main/requiredaction

### Cluster

Keycloak Cluster Config:
https://gist.github.com/dasniko/3a57913047af3ca1b6b0a83b294dc1a1

Infinispan Docs:
https://infinispan.org/docs/14.0.x/

Embedded Infinispan / Cluster Transports:
https://infinispan.org/docs/14.0.x/titles/embedding/embedding.html#cluster-transport

JGroups Discovery Protocols:
http://jgroups.org/manual5/index.html#DiscoveryProtocols

### Mitigating Security Threats

https://www.keycloak.org/docs/latest/server_admin/index.html#mitigating-security-threats

## Kontakt

Niko Köbler  
https://www.n-k.de
