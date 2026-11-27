# CLAUDE.md

## Branch `codespaces`

Tryout of running the workshop's Keycloak in GitHub Codespaces, used only through the browser (no local Docker).
Unneeded resources (bookshop, benchmark, terraform, ops/cluster setup, …) were removed in this branch.

### Setup

- `.devcontainer/devcontainer.json`: `base:ubuntu-24.04` + docker-in-docker feature, min. 2 cores (4 recommended), `postStartCommand` runs `.devcontainer/kc.sh up`.
- `.devcontainer/kc.sh`: wrapper around `docker compose` (`up|down|restart|logs|status|url|db`; `db` opens psql on the Keycloak database), waits for the DinD daemon.
- `docker-compose.yml`: keycloak, proxy (nginx), postgres, ldap, mail. Only nginx publishes port 8080.
  Keycloak publishes only its management port 9000 directly (health/metrics are plain GETs, no CORS/hostname issues).
- The public URL is defined once as YAML anchor `x-public-url` from `CODESPACE_NAME` and `GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN`.
  Compose therefore fails outside a codespace — intended.
- Keycloak runs plain HTTP; TLS is terminated by the Codespaces proxy.
  The truststore (`certs/rootCA.crt`) is still required for LDAPS to the `ldap` service — keep it.

### Decisions (verified in a codespace, 2026-11-27)

- **The Codespaces port forwarding proxy rewrites `Host` to `localhost:8080` and `Origin` to `https://localhost:8080`**
  (cf. https://github.com/orgs/community/discussions/147513, which claims `Host` stays unchanged — not true for us).
  Keycloak (`DefaultCors.checkOrigin()`) then answers CORS-checked requests (token endpoint, admin/account REST APIs) with 403 "Invalid origin".
- **nginx in front of Keycloak** (`nginx/keycloak.conf.template`, envsubst with `KC_PUBLIC_URL`):
  - maps `Origin: http(s)://localhost:8080` back to the public URL, other origins untouched;
  - sets `Host`/`X-Forwarded-Host`/`-Proto: https`/`-Port: 443` to the public URL, Keycloak uses `KC_PROXY_HEADERS: xforwarded`.
    Needed because clients without web origins (e.g. `account-console`) pass the CORS check only if `Origin` equals the origin
    of the *raw request URI* (not `KC_HOSTNAME`). Trusting these headers is fine, as Keycloak has no published port.
- **`KC_HOSTNAME` stays an explicit full URL.**
- **Base image pinned to `ubuntu-24.04`**: `base:ubuntu` resolves to 26.04 (resolute), where docker-in-docker cannot install moby;
  the codespace then silently falls back to a recovery container (alpine, no Docker).

### Rejected approaches

- `protocol: https` port forwarding to a TLS-serving Keycloak: dropped together with TLS in Keycloak.
- Dynamic hostname (`KC_HOSTNAME` unset, `hostname-strict=false`): doesn't solve the rewritten `Origin`, and Keycloak would see `http://localhost`.
- Adding `http://localhost:8080` as web origin per client via `kcadm`: has to be done for every browser client in every realm, error-prone.
- Deriving the public origin from nginx `$host`: `Host` is rewritten by the Codespaces proxy, too.

### Debugging tip

CORS problems: `KC_LOG_LEVEL: info,org.keycloak.services.cors:debug` shows the received origin and the allowed origins.
