#!/usr/bin/env bash
# Ensure current working directory is the project root
cd "$(dirname "$0")/.."

# Create venv
python3 -m venv .venv
source .venv/bin/activate
# Install pip dependencies
pip install -r requirements.txt
# Install Ansible roles/collections
ansible-galaxy install -r requirements.yml
