#!/usr/bin/env bash

# Docker Client installation
#
curl -L https://download.docker.com/linux/static/stable/x86_64/ docker-19.03.9.tgz /tmp/docker-19.03.9.tgz && \
     tar xzvf /tmp/docker-19.03.9.tgz && \
     sudo mv docker/docker /usr/local/bin/docker && \
      rm -rf docker/ && \
     rm /tmp/docker-19.03.9.tgz
# Docker Machine installation
#
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
