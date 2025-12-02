# Ansible Boilerplate

This is a generic Ansible project boilerplate.


## Structure

- `playbooks/`: Contains the main playbooks that orchestrate tasks and roles.
- `roles/`: Contains reusable Ansible roles. Create new roles with `ansible-galaxy init roles/role_name`.
- `inventory/`: Contains inventory files that define your target hosts and groups.
- `group_vars/`: Variables that apply to groups of hosts defined in your inventory.
- `host_vars/`: Variables that apply to specific individual hosts.
- `files/`: Static files to be copied to remote hosts without modification. Use with the `copy` module.
- `templates/`: Jinja2 template files that support variable substitution. Use with the `template` module.
- `filter_plugins/`: Custom Python filter functions for advanced data transformation in templates and playbooks.

## Setup

1. Run the bootstrap script to set up the environment:
    ```bash
    ./scripts/bootstrap.sh
    ```

2. Activate the virtual environment:
    ```bash
    source scripts/activate
    ```

## Usage

Run the main playbook using the helper script:

```bash
./scripts/run.sh
```

Or manually:

```bash
ansible-playbook -i inventory/hosts.ini playbooks/main.yml
```

## Environments

To support multiple environments (e.g., production, staging), you can create separate inventory files:

1. Create `inventory/production.ini` and `inventory/staging.ini`.
2. Run with the specific inventory:
    ```bash
    ./scripts/run.sh playbooks/main.yml inventory/production.ini
    ```

## Ansible Vault

This project supports [Ansible Vault](https://docs.ansible.com/ansible/latest/vault_guide/vault.html) for encrypting sensitive data.

### Setup Vault

1. Generate a vault password file:
    ```bash
    ./scripts/generate-vault-password.sh
    ```

2. This creates `.vault_pass` which is automatically used by `scripts/run.sh`.

### Using Vault

Create an encrypted variables file:
```bash
ansible-vault create group_vars/all/vault.yml --vault-password-file .vault_pass
```

Encrypt an existing file:
```bash
ansible-vault encrypt <file> --vault-password-file .vault_pass
```

Edit an encrypted file:
```bash
ansible-vault edit group_vars/all/vault.yml --vault-password-file .vault_pass
```

Decrypt a file:
```bash
ansible-vault decrypt <file> --vault-password-file .vault_pass
```

### Best Practices

- Keep `.vault_pass` secure and never commit it to git (it's already in `.gitignore`)
- Use `vault.yml` for sensitive variables and reference them in your playbooks
- See `group_vars/all/vault.yml.example` for an example structure

## Helper Commands

### Create a new role
```bash
ansible-galaxy init roles/my_new_role
```

### Linting
```bash
ansible-lint
```


