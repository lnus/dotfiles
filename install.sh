#!/usr/bin/bash
ansible-playbook install.yml -i inventory.yml -K --diff
