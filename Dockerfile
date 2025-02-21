# This is just for testing install scripts
# Having a Dockerfile for your dotfiles feels... odd but fun!
FROM ubuntu:latest

RUN apt-get update && apt-get install -y git curl ansible --no-install-recommends

COPY . /root/.dotfiles

WORKDIR /root/.dotfiles

CMD ["/bin/bash"]
