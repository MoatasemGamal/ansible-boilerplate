#!/usr/bin/env bash
# Ensure we are in the project root
cd "$(dirname "$0")/.."

PLAYBOOK=${1:-playbooks/main.yml}
INVENTORY=${2:-inventory/hosts.ini}

# Activate venv if not already active
if [[ -z "$VIRTUAL_ENV" ]]; then
    if [[ -f .venv/bin/activate ]]; then
        source .venv/bin/activate
    elif [[ -f ../.venv/bin/activate ]]; then
        source ../.venv/bin/activate
    fi
fi

ansible-playbook -i "$INVENTORY" "$PLAYBOOK" \
  --diff \
  --forks 10 \
  --limit "${LIMIT:-all}" \
  "$@"
