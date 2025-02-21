#!/usr/bin/bash
# ansible-playbook -c local -i "localhost," install.yml -v
ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook -c local -i "localhost," install.yml -v
