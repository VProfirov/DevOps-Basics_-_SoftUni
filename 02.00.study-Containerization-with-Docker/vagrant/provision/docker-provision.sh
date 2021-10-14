#!/usr/bin/env bash
# SYSTEM PROVISION PHASE
echo "\\r\\n ** Addhosts..."
echo "192.168.99.100 docker.dob.lab docker" | tee -a /etc/hosts

# APPLICATION PROVISION PHASE
echo "\\r\\n ** Clean pre-existing docker packages"
        echo "\\r\\n --> check: pre-existance"
        rpm -qa | grep -iE "podman|buildah|runc"
echo "\\r\\n --> action: clean-up"
sudo dnf remove -y podman buildah runc
# sudo dnf remove podman runc

echo "y"

echo "\r\n ** Enable docker repo"
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# echo "** Trying to remove pre-existing docker packages"
# sudo dnf remove docker docker-client docker-client-latest \
#                 docker-common docker-latest docker-latest-logrotate \
# 		remove docker docker-client docker-client-latest \
#                 docker-logrotate docker-selinux docker-engine-selinux docker-engine

echo "\r\n ** Installing docker packages"
sudo dnf install -y docker-ce docker-ce-cli


echo "\r\n --> check: containerd.io is installed"
if [ -z "$(rpm -qa | grep -iE "^containerd.io")" ]; then
        echo "\r\n --> action: containerd.io install"
        sudo dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages\
                        /containerd.io-1.4.9-3.1.el7.x86_64.rpm

                        #TODO: Do a webaddress check for the latest rpm (wget -> grep -iE "containerd.io-*" -> sort -r -> sed/awk {take the first of reversed-list})
fi

echo "\r\n ** Enable + Start Docer"
for action in {status,enable,start,status}; do
        echo "\r\n --> action: ${action}"
        sudo systemctl $action docker;
        # TODO: maybe more adequate checks
        # NOTE: vagrant can blow an error because of the "systemctl status ..." needing a "quit" action
done;

echo "\r\n ** Adding the $USER (vagrant) to the docker Grouop"
getent group docker;
# sudo usermod -aG docker $USER;
sudo usermod -aG docker vagrant;
getent group docker;
