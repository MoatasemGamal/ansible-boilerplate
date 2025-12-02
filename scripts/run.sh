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

# Check for vault password file
VAULT_OPTS=""
if [[ -f ".vault_pass" ]]; then
    VAULT_OPTS="--vault-password-file .vault_pass"
fi

ansible-playbook -i "$INVENTORY" "$PLAYBOOK" \
  $VAULT_OPTS \
  --diff \
  --forks 10 \
  --limit "${LIMIT:-all}" \
  "$@"
