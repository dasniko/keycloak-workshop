#!/usr/bin/env bash
#
# update-images.sh - pull all container images used in this workshop.
#
# Images are discovered from the repository itself (compose files, the Keycloak
# Dockerfile and the `docker run` helper scripts), so the list stays correct
# when versions change. Locally built images (e.g. `keycloak-workshop`) are
# skipped, they are created by `docker compose build`.
#
# Usage:
#   ./various/update-images.sh [-l|--list] [-h|--help]
#
# Runs on macOS and Linux, with bash 3.2+ and either GNU or busybox grep/sed.
#
# Environment:
#   DOCKER   container CLI to use (default: docker, or podman if docker is
#            not installed - common on Fedora/RHEL)

set -uo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# Prefer an explicitly requested CLI, else docker, else podman (Fedora/RHEL)
if [ -n "${DOCKER:-}" ]; then
  :
elif command -v docker >/dev/null 2>&1; then
  DOCKER=docker
elif command -v podman >/dev/null 2>&1; then
  DOCKER=podman
else
  DOCKER=docker
fi
LIST_ONLY=false

usage() {
  sed -n '2,17p' "${BASH_SOURCE[0]}" | sed 's/^#\{1,2\} \{0,1\}//'
}

while [ $# -gt 0 ]; do
  case "$1" in
    -l|--list) LIST_ONLY=true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

discover_images() {
  # compose files: `image: <name>`, ignoring services that are built locally
  # (those have no registry/tag, e.g. `keycloak-workshop`)
  grep -hE '^[[:space:]]*image:[[:space:]]' "${REPO_ROOT}"/*.yml 2>/dev/null \
    | sed -E 's/^[[:space:]]*image:[[:space:]]*//; s/[[:space:]]*(#.*)?$//' \
    | grep -E '[/:]'

  # Keycloak base image from the Dockerfile ARG default
  grep -hE '^ARG[[:space:]]+KEYCLOAK_BASE_IMAGE=' "${REPO_ROOT}/Dockerfile" 2>/dev/null \
    | sed -E 's/^ARG[[:space:]]+KEYCLOAK_BASE_IMAGE=//'

  # images used in `docker run` helper scripts (terraform, benchmark)
  grep -rhE '(^|[[:space:]])docker run ' "${REPO_ROOT}"/*.sh "${REPO_ROOT}"/*.bat \
       "${REPO_ROOT}"/benchmark/*.sh "${REPO_ROOT}"/benchmark/*.bat 2>/dev/null \
    | grep -viE '^[[:space:]]*(#|::|rem )' \
    | tr ' ' '\n' \
    | grep -E '^[a-z0-9][a-z0-9._-]*(\.[a-z]{2,}|:[0-9]+)?/[a-z0-9._/-]+:[A-Za-z0-9._-]+$'
}

# bash 3.2 (macOS default) has no `mapfile`, so read the list line by line
IMAGES=()
while IFS= read -r line; do
  [ -n "${line}" ] && IMAGES+=("${line}")
done < <(discover_images | sort -u)

if [ ${#IMAGES[@]} -eq 0 ]; then
  echo "No images found in ${REPO_ROOT} - has the repository layout changed?" >&2
  exit 1
fi

echo "==> Images used in this workshop (${#IMAGES[@]}):"
printf '  %s\n' "${IMAGES[@]}"

if [ "${LIST_ONLY}" = true ]; then
  exit 0
fi

if ! command -v "${DOCKER}" >/dev/null 2>&1; then
  echo "Error: '${DOCKER}' not found in PATH. Is Docker installed?" >&2
  exit 1
fi

if ! daemon_error="$("${DOCKER}" info 2>&1 >/dev/null)"; then
  echo "Error: cannot talk to the container daemon:" >&2
  printf '%s\n' "${daemon_error}" | sed 's/^/  /' >&2
  case "${daemon_error}" in
    *"permission denied"*|*"Permission denied"*)
      # typical on Linux when the user is not in the `docker` group
      echo "Hint: add your user to the 'docker' group and re-login:" >&2
      echo "        sudo usermod -aG docker \"\${USER}\" && newgrp docker" >&2
      echo "      or run this script with sudo." >&2
      ;;
    *)
      echo "Hint: is Docker running? (Docker Desktop, or 'sudo systemctl start docker')" >&2
      ;;
  esac
  exit 1
fi

echo
echo "==> Pulling with '${DOCKER}'..."
failed=""
i=0
for image in "${IMAGES[@]}"; do
  i=$((i + 1))
  echo
  echo "--- [${i}/${#IMAGES[@]}] ${image}"
  if ! "${DOCKER}" pull "${image}"; then
    failed="${failed}${image}"$'\n'
  fi
done

echo
if [ -z "${failed}" ]; then
  echo "==> Done, all ${#IMAGES[@]} images are up to date."
else
  echo "==> Done, but the following image(s) failed to pull:" >&2
  printf '%s' "${failed}" | sed 's/^/  /' >&2
  exit 1
fi
