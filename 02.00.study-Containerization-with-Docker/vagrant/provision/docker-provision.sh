#!/usr/bin/env bash

echo '** Clean pre-existing docker packages'
        echo '--> check: pre-existance'
        rpm -qa | grep -iE "podman|buildah|runc"

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


echo '--> check: containerd.io is installed'
if [ -z "$(rpm -qa | grep -iE "^containerd.io")" ]; then
        echo '*** containerd.io install'
        sudo dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages\
                        /containerd.io-1.4.9-3.1.el7.x86_64.rpm

                        #TODO: Do a webaddress check for the latest rpm (wget -> grep -iE "containerd.io-*" -> sort -r -> sed/awk {take the first of reversed-list})
fi

echo '** Enable + Start Docer'
for action in {status,enable,start,status}; do
        sudo systemctl $action docker;
        # TODO: maybe more adequate checks
done;

echo '** Adding the $USER (vagrant) to the docker Grouop'
sudo getent group docker;
sudo usermod -aG docker $USER;
sudo getent group docker;
