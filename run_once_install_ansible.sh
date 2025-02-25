#!/bin/bash

install_on_debian() {
    echo "Detected Debian-based system. Installing Ansible..."
    sudo apt-get update
    sudo apt-get install -y ansible
}

install_on_fedora() {
    echo "Detected Fedora-based system. Installing Ansible..."
    sudo dnf update -y
    sudo dnf install -y ansible
}

install_on_arch() {
    echo "Detected Arch-based system. Installing Ansible..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm ansible
}

install_ansible() {
    if [ -f /etc/os-release ]; then
        # Source the os-release file to get distribution information
        . /etc/os-release
        case "$ID" in
            debian|ubuntu)
                install_on_debian
                ;;
            fedora|rhel|centos)
                install_on_fedora
                ;;
            arch|manjaro)
                install_on_arch
                ;;
            *)
                echo "Unsupported Linux distribution: $ID"
                exit 1
                ;;
        esac
    else
        echo "/etc/os-release not found. Unable to detect Linux distribution."
        exit 1
    fi
}


install_ansible

ansible-playbook ~/.bootstrap/setup.yml -K --diff
