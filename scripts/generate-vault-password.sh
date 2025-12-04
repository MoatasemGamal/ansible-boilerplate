#!/usr/bin/env bash
# Generate a secure password for Ansible Vault

# Ensure we are in the project root
cd "$(dirname "$0")/.."

VAULT_PASSWORD_FILE=".vault_pass"

if [[ -f "$VAULT_PASSWORD_FILE" ]]; then
    echo "Error: $VAULT_PASSWORD_FILE already exists."
    echo "If you want to regenerate, delete it first."
    exit 1
fi

# Generate a random 32-character password
openssl rand -base64 32 > "$VAULT_PASSWORD_FILE"
chmod 600 "$VAULT_PASSWORD_FILE"

echo "Vault password file created: $VAULT_PASSWORD_FILE"
echo "This file is ignored by git and should be kept secure."
echo ""
echo "To encrypt a file with vault:"
echo "  ansible-vault encrypt <file> --vault-password-file $VAULT_PASSWORD_FILE"
echo ""
echo "To create an encrypted variables file:"
echo "  ansible-vault create inventory/group_vars/all/vault.yml --vault-password-file $VAULT_PASSWORD_FILE"
