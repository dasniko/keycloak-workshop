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

print_urls() {
  local domain="${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:?not running in a Codespace}"
  echo
  echo "Keycloak:            https://${CODESPACE_NAME}-8080.${domain}"
  echo "Keycloak Management: https://${CODESPACE_NAME}-9000.${domain}  (/health, /metrics)"
  echo "Mailpit:             https://${CODESPACE_NAME}-8025.${domain}"
  echo
}

case "${1:-}" in
  up)
    wait_for_docker
    compose up -d --wait
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
