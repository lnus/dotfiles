#!/bin/bash

install_on_debian() {
    sudo apt-get update
    sudo apt-get install -y ansible
}

# FIX: Not distro agnostic at all
install_on_debian

ansible-playbook ~/.bootstrap/setup.yml -K
