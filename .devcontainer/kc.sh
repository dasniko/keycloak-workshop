#!/usr/bin/env bash
#
# kc.sh - manage the workshop stack (docker-compose.yml) inside GitHub Codespaces.
#
# Usage: .devcontainer/kc.sh {up|down|restart|logs [service]|status|url|db [psql args]}
#

set -euo pipefail

cd "$(dirname "$0")/.."

compose() {
  docker compose "$@"
}

# The Docker daemon of the docker-in-docker feature may still be starting when postStartCommand runs.
wait_for_docker() {
  for _ in $(seq 1 60); do
    docker info >/dev/null 2>&1 && return 0
    sleep 1
  done
  echo "Docker daemon is not available." >&2
  exit 1
}

# The bookshop checkout (browser) needs two ports public:
# - 8083 (cart): called cross-origin with an Authorization header; the CORS preflight carries no GitHub auth cookie,
#   so a private port would answer it with a redirect to the GitHub login.
# - 8080 (Keycloak): keycloak-js loads a hidden iframe from Keycloak on init; on a private port it is redirected
#   to the GitHub login, which can't be framed, and checkout hangs.
# The ports are only known to the Codespaces proxy once they are forwarded, so retry for a while.
make_ports_public() {
  for _ in $(seq 1 30); do
    gh codespace ports visibility 8080:public 8083:public -c "${CODESPACE_NAME:?not running in a Codespace}" >/dev/null 2>&1 && return 0
    sleep 2
  done
  echo "Could not make ports 8080 and 8083 public, the bookshop checkout won't work." >&2
  echo "Set them manually: Ports tab -> 8080 / 8083 -> Port Visibility -> Public" >&2
}

print_urls() {
  local domain="${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:?not running in a Codespace}"
  echo
  echo "Keycloak:            https://${CODESPACE_NAME}-8080.${domain}"
  echo "Keycloak Management: https://${CODESPACE_NAME}-9000.${domain}  (/health, /metrics)"
  echo "Mailpit:             https://${CODESPACE_NAME}-8025.${domain}"
  echo "Bookshop:            https://${CODESPACE_NAME}-8081.${domain}/shop"
  echo
}

case "${1:-}" in
  up)
    wait_for_docker
    compose up -d --wait
    make_ports_public
    print_urls
    ;;
  down)
    compose down
    ;;
  restart)
    compose restart keycloak
    ;;
  logs)
    shift
    compose logs -f "${@:-keycloak}"
    ;;
  status)
    compose ps
    ;;
  url)
    print_urls
    ;;
  db)
    # psql on the Keycloak database; extra args are passed to psql, e.g. db -c 'select name from realm'
    shift
    compose exec postgres psql -U keycloak keycloak "$@"
    ;;
  *)
    echo "Usage: $0 {up|down|restart|logs [service]|status|url|db [psql args]}" >&2
    exit 1
    ;;
esac
