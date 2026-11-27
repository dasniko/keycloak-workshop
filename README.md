# Keycloak Workshop by @dasniko

![](https://img.shields.io/badge/Keycloak-26.8-blue)

## Prerequisites

* A personal [GitHub](https://github.com) account (the workshop runs in [GitHub Codespaces](https://github.com/features/codespaces), no local Docker installation needed)
* Enough free Codespaces quota, see below
* A current browser

## Start your codespace

1. On the repository page, click _Code_ → _Codespaces_ → _..._ → _New with options..._
2. Select the branch `codespaces` and a **4-core** machine type (recommended; 2-core works, but Keycloak starts noticeably slower).
3. Wait until the stack is up (Keycloak, Postgres, LDAP and Mailpit start automatically), then open the _Ports_ tab and click the _Keycloak_ (8080) or _Mailpit_ (8025) address.  
   `.devcontainer/kc.sh url` prints the URLs as well.

Helper script in the codespace terminal: `.devcontainer/kc.sh {up|down|restart|logs [service]|status|url|db [psql args]}`

⚠️ **Free quota:** personal accounts include 120 core hours per month (GitHub Pro: 180). A 4-core codespace uses 4 core hours per hour, so two workshop days of ~8 hours take about 64 core hours.
**Stop your codespace at the end of each day** (_Codespaces_ → _..._ → _Stop codespace_), and delete it after the workshop to avoid storage usage.

## Slides & examples

* 📺 OAuth2, OIDC & JWT Basics:  
  https://speakerdeck.com/dasniko/oauth2-oidc-and-jwt-important-basics

## More links

### Keycloak docs

* Guides: https://www.keycloak.org/guides
* Docs: https://www.keycloak.org/documentation

### Common examples, extensions & links

* Niko's YouTube Channel:
https://www.youtube.com/@dasniko
* Niko's GitHub Profile:
https://github.com/dasniko
* Keycloak Extension Examples:
https://github.com/dasniko/keycloak-extensions-demo
* Testcontainer-Keycloak Project:
https://github.com/dasniko/testcontainers-keycloak

## Standards, Specs & BCP Guides

#### OAuth 2.0

* OAuth 2.0 Overview: https://oauth.net/2/
* OAuth Core, RFC 6749: https://datatracker.ietf.org/doc/html/rfc6749
* OAuth 2.0 Threat Model and Security Considerations, RFC 6819: https://datatracker.ietf.org/doc/html/rfc6819
* OAuth 2.0 Token Revocation, RFC 7009: https://datatracker.ietf.org/doc/html/rfc7009
* Proof Key for Code Exchange, RFC 7636: https://datatracker.ietf.org/doc/html/rfc7636
* OAuth 2.0 for Native Apps, RFC 8252: https://datatracker.ietf.org/doc/html/rfc8252
* OAuth 2.0 Device Authorization Grant, RFC 8628: https://datatracker.ietf.org/doc/html/rfc8628
* OAuth 2.0 for Browser-Based Apps: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-browser-based-apps
* Best Current Practice for OAuth 2.0 Security, RFC 9700: https://datatracker.ietf.org/doc/html/rfc9700

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
