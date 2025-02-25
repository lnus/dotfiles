ARG BASE_IMAGE=ubuntu:latest
FROM ${BASE_IMAGE}

RUN if command -v apt-get &> /dev/null; then \
        apt-get update && apt-get install -y git curl sudo; \
    elif command -v dnf &> /dev/null; then \
        dnf -y update && dnf -y install git curl sudo; \
    elif command -v pacman &> /dev/null; then \
        pacman -Syu --noconfirm && pacman -S --noconfirm git curl sudo; \
    fi

# Set up a non-root user
ARG USERNAME=testuser
RUN useradd -m ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}

WORKDIR /home/${USERNAME}
USER ${USERNAME}

CMD ["/bin/bash"]
