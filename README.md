# Keycloak Workshop by @dasniko

## Voraussetzungen

* Texteditor (VS Code, Notepad++, etc.)
* [Docker](https://www.docker.com/) und [Docker Compose](https://docs.docker.com/compose/) V2 installiert und lauffähig (ggf. lokale Admin-Rechte auf dem Rechner erteilen)  
  _(ggf. können Lizenzkosten für die Nutzung von Docker Desktop anfallen, bitte informieren! Docker Desktop ist je nach Plattform nicht unbedingt notwendig für den Betrieb von Docker. Support für Docker kann nicht im Rahmen des Trainings und der Vorbereitung dessen übernommen werden! U.U. funktioniert auch Podman, hierfür kann aber keinerlei Support bereitgestellt werden!)_
* Internetzugriff (ggf. Proxy-/Firewall-/VPN-Konfigurationen etc. überprüfen)
* Browser

_Dieses Repository clonen oder über den u.a. Download-Link runterladen und entpacken._

## Download Workshop-Material

👉 https://github.com/dasniko/keycloak-workshop/archive/refs/heads/main.zip

## Docker Images

Folgende Docker Images werden im Workshop verwendet und können (sollten!) bereits vor dem Workshop mit den folgenden Befehlen runtergeladen werden:

```
docker pull quay.io/keycloak/keycloak:26.0
docker pull postgres:16
docker pull nginx:alpine
docker pull axllent/mailpit:latest
docker pull osixia/openldap:latest
docker pull osixia/phpldapadmin:latest
docker pull dasniko/bookshop:0.0.8
```

## Folien & Beispiele

* 📺 OAuth2, OIDC & JWT Basics:  
  https://speakerdeck.com/dasniko/oauth2-oidc-and-jwt-important-basics
* 📺 Status Quo of OAuth 2:  
  https://speakerdeck.com/dasniko/status-quo-of-oauth-2
* 📈 Sequenz-Diagramm [Authorization Code Grant OIDC](Seq_Authorization_Code_Grant_OIDC.pdf)
* 📈 Sequenz-Diagramm [PKCE for OAuth2](Seq_PKCE_for_OAuth2.pdf)
* 📖 Bookshop (Verteilte Anwendung, Basis Quarkus, Sprint Boot & React.JS):  
https://github.com/dasniko/keycloak-bookshop-demo

## Links für die Workshop-Systeme

* Keycloak - http://localhost:8080
* Bookshop - http://localhost:8081
* Mailserver - http://localhost:8025
* LDAP Admin - http://localhost:8090

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

### Extension-Empfehlungen

* Metrics SPI: https://github.com/aerogear/keycloak-metrics-spi
* Keycloak Config CLI: https://github.com/adorsys/keycloak-config-cli
* Keycloak Home IdP Discovery: https://github.com/sventorben/keycloak-home-idp-discovery
* Restrict Client Auth: https://github.com/sventorben/keycloak-restrict-client-auth

### Cluster-/Infinispan-Docs

* Infinispan Docs: https://infinispan.org/docs/15.0.x/
* Embedded Infinispan / Cluster Transports: https://infinispan.org/docs/15.0.x/titles/embedding/embedding.html#cluster-transport
* JGroups Discovery Protocols: http://jgroups.org/manual5/index.html#DiscoveryProtocols

### Standards, Specs & BCP Guides

#### OAuth 2.0

* OAuth 2.0 Overview: https://oauth.net/2/
* OAuth Core, RFC 6749: https://datatracker.ietf.org/doc/html/rfc6749
* OAuth 2.0 Threat Model and Security Considerations, RFC 6819: https://datatracker.ietf.org/doc/html/rfc6819
* OAuth 2.0 Token Revocation, RFC 7009: https://datatracker.ietf.org/doc/html/rfc7009
* Proof Key for Code Exchange, RFC 7636: https://datatracker.ietf.org/doc/html/rfc7636
* OAuth 2.0 for Native Apps, RFC 8252: https://datatracker.ietf.org/doc/html/rfc8252
* OAuth 2.0 Device Authorization Grant, RFC 8628: https://datatracker.ietf.org/doc/html/rfc8628
* OAuth 2.0 for Browser-Based Apps: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-browser-based-apps
* OAuth 2.0 Security Best Current Practice: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics

#### OAuth 2.1

* OAuth 2.1 Overview: https://oauth.net/2.1/
* OAuth 2.1 Draft: https://datatracker.ietf.org/doc/draft-ietf-oauth-v2-1
* GNAP Overview: https://oauth.net/gnap/

#### Tokens

* OAuth 2.0 Bearer Token Usage, RFC 6750: https://datatracker.ietf.org/doc/html/rfc6750
* OAuth 2.0 Token Binding, Draft: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-token-binding-08
* OAuth 2.0 Mutual-TLS Client Authentication and Certificate-Bound Access Tokens, RFC 8705: https://datatracker.ietf.org/doc/html/rfc8705
* JSON Web Token, RFC 7519: https://datatracker.ietf.org/doc/html/rfc7519
* JSON Web Token (JWT) Best Current Practice, RFC 8725: https://datatracker.ietf.org/doc/html/rfc8725
* JSON Web Token (JWT) Profile for OAuth 2.0 Access Tokens, RFC 9068: https://datatracker.ietf.org/doc/html/rfc9068
