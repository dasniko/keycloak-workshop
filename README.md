# Keycloak Workshop by @dasniko

![](https://img.shields.io/badge/Keycloak-26.3-blue)

## Prerequisites

* Texteditor (VS Code, Notepad++, etc.)
* [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) V2 installed and running on `localhost` (if necessary, grant local admin rights on the computer)  
  _(License costs may apply for the use of Docker Desktop, please inform yourself! Depending on the platform, Docker Desktop is not absolutely necessary for the operation of Docker. Support for Docker cannot be provided as part of the training and preparation for it! Podman may also work, but no support can be provided for this!)_
* Internet access (check proxy/firewall/VPN configurations etc. if necessary)
* Browser

_Clone this repository (with `git clone https://github.com/dasniko/keycloak-workshop.git`) or download it via the following link and unzip it._  

> 🚨 Please make sure that your local folder you clone the repo to, is called `keycloak-workshop`!

## Download workshop resources

👉 https://github.com/dasniko/keycloak-workshop/archive/refs/heads/main.zip

> 🚨 If you unzip it, make sure the folder is called `keycloak-workshop`, not _keycloak-workshop-main_!

## Docker images

The following images are being used in the workshop and can (should!) be pulled before the workshop:

```
docker pull quay.io/keycloak/keycloak:26.3
docker pull postgres:17
docker pull nginx:alpine
docker pull axllent/mailpit:latest
docker pull jaegertracing/all-in-one:latest
docker pull dasniko/openldap_flintstones:latest
docker pull ghcr.io/dasniko/keycloak-bookshop-demo:0.0.9-snapshot
```

## Slides & examples

* 📺 OAuth2, OIDC & JWT Basics:  
  https://speakerdeck.com/dasniko/oauth2-oidc-and-jwt-important-basics
* 📺 Status Quo of OAuth 2:  
  https://speakerdeck.com/dasniko/status-quo-of-oauth-2
* 📖 Smiling Bookshop (Distributed application, based on Quarkus, Sprint Boot & React.JS):  
https://github.com/dasniko/keycloak-bookshop-demo

## Links for systems used in this workshop

* Keycloak - https://localhost:8443
  * Management Port - https://localhost:9000
* Bookshop - http://localhost:8081
  * Checkout - http://localhost:3000
* Mailserver - http://localhost:8025
* Jaeger - http://localhost:16686

## More links

### Keycloak docs

* Guides: https://www.keycloak.org/guides
* Docs: https://www.keycloak.org/documentation
* Admin CLI: https://www.keycloak.org/docs/latest/server_admin/index.html#admin-cli
* Benchmark: https://www.keycloak.org/keycloak-benchmark/

### Common examples, extensions & links

* Niko's YouTube Channel:
https://www.youtube.com/@dasniko
* Niko's GitHub Profile:
https://github.com/dasniko
* Keycloak Extension Examples:
https://github.com/dasniko/keycloak-extensions-demo
* Testcontainer-Keycloak Project:
https://github.com/dasniko/testcontainers-keycloak
* Moderator @ Keycloak Discourse Forum:
https://keycloak.discourse.group/

### Extension recommendations

* Keycloak Config CLI: https://github.com/adorsys/keycloak-config-cli
* Keycloak Home IdP Discovery: https://github.com/sventorben/keycloak-home-idp-discovery - _meanwhile most functionality available in Keycloak via Organization feature_
* Restrict Client Auth: https://github.com/sventorben/keycloak-restrict-client-auth - _more convenience than security_
* Keycloakify (UI Templates): https://www.keycloakify.dev

### Cluster-/Infinispan docs

* Infinispan docs: https://infinispan.org/docs/15.0.x/
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
* Best Current Practice for OAuth 2.0 Security: https://datatracker.ietf.org/doc/html/rfc9700

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

#### OIDC

* All OIDC Specifications: https://openid.net/developers/specs/
* OpenID Connect Core 1.0: https://openid.net/specs/openid-connect-core-1_0.html
* OpenID Connect RP-Initiated Logout 1.0: https://openid.net/specs/openid-connect-rpinitiated-1_0.html
* OpenID Connect Session Management 1.0: https://openid.net/specs/openid-connect-session-1_0.html
* OpenID Connect Front-Channel Logout 1.0: https://openid.net/specs/openid-connect-frontchannel-1_0.html
* OpenID Connect Back-Channel Logout 1.0: https://openid.net/specs/openid-connect-backchannel-1_0.html
