#!/usr/bin/env bash

# SYSTEM PROVISION PHASE
echo " ** Add hosts..."
echo "192.168.99.130 docker.dob.lab.30 docker30" | tee -a /etc/hosts
echo "192.168.99.131 docker.dob.lab.31 docker31" | tee -a /etc/hosts
echo "192.168.99.132 docker.dob.lab.31 docker32" | tee -a /etc/hosts
echo "192.168.99.133 docker.dob.lab.31 docker33" | tee -a /etc/hosts

## CLEANUP PHASE - cleanup runc - the pre-installed conflicts with docker. Also RHEL's podman also, but there is none in UBUNTU
# echo "** Trying to remove pre-existing docker packages"
# zypper remove -y docker docker-engine docker.io containerd runc

# APPLICATION PROVISION PHASE
echo " ** Installing docker packages"
# zypper update -y
zypper refresh
zypper install -y python-packaging
zypper install -y docker python3-docker-compose

echo " ** Enable + Start Docer"
for action in {status,enable,start,status}; do
        echo " --> action: ${action}"
        systemctl "$action" docker;
        # TODO: maybe more adequate checks
done;

# NOTE: si there an " ** Firewall" equivalent for OpenSUSE (preinstalled?)

echo " ** Adding the $USER (vagrant) to the docker Group"
getent group docker;
# To Work hace to add the $USER(vagrant) to sudoers.d in advance
## usermod -aG docker $USER;
usermod -aG docker vagrant;
getent group docker;


## Adding Extra Tools
# echo " ** Adding extra toools: lazydocker"
# zypper install -y lazydocker
## hacking it ->
cp /vagrant/provision/lazydocker /usr/bin

# # UPDATING PART
# echo " ** Updating the system"
# zypper refresh
# zypper update -y

###### PROVISION the Vagrant Machines
# /vagrant/provision/'Docker Machine and Client install.sh'
