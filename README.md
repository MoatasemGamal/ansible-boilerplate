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

## Helper Commands

### Create a new role
```bash
ansible-galaxy init roles/my_new_role
```

### Linting
```bash
ansible-lint
```

