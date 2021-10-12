#!/usr/bin/env bash

echo '** Clean pre-existing docker packages'
sudo dnf remove podman buildah runc

echo '** Enable docker repo'
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo '** Trying to remove pre-existing docker packages'
sudo dnf remove remove docker docker-client docker-client-latest \
                docker-common docker-latest docker-latest-logrotate \
		remove docker docker-client docker-client-latest \
                docker-logrotate docker-selinux docker-engine-selinux docker-engine

echo '** Installing docker packages'
sudo dnf install docker-ce docker-cli-ce


# TODO: FINISH! Finished file in 02.00.