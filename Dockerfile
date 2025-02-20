# This is just for testing install scripts
# Having a Dockerfile for your dotfiles feels... odd
FROM ubuntu:latest

# Install gnu stow
RUN apt-get update && apt-get install -y git ansible --no-install-recommends

COPY . /root/.dotfiles

WORKDIR /root/.dotfiles

CMD ["/bin/bash"]
