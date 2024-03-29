#!/usr/bin/env bash
# SYSTEM PROVISION PHASE
echo " ** Add hosts..."
echo "192.168.99.101 docker.dob.lab docker" | tee -a /etc/hosts

# APPLICATION PROVISION PHASE
echo " ** Clean pre-existing docker packages"
        echo " --> check: pre-existing"
        rpm -qa | grep -iE "podman|buildah|runc"
echo " --> action: clean-up"
dnf remove -y podman buildah runc
# docker uses: runc and will install it's own with the correct version number
# podman uses the "buildah" libs to build the images which somehow conflicts with the docker installation too (need-to-check)
# sudo dnf remove podman runc

echo " ** Enable docker repo"
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# echo "** Trying to remove pre-existing docker packages"
# sudo dnf remove docker docker-client docker-client-latest \
#                 docker-common docker-latest docker-latest-logrotate \
# 		remove docker docker-client docker-client-latest \
#                 docker-logrotate docker-selinux docker-engine-selinux docker-engine

echo " ** Installing docker packages"
dnf install -y docker-ce docker-ce-cli


echo " --> check: is containerd.io installed"
if [ -z "$(rpm -qa | grep -iE "^containerd.io")" ]; then
        echo " --> action: install containerd.io"
        dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages\
                        /containerd.io-1.4.9-3.1.el7.x86_64.rpm

                        #TODO: Do a web address check for the latest rpm (wget -> grep -iE "containerd.io-*" -> sort -r -> sed/awk {take the first of reversed-list})
fi

echo " ** Enable + Start Docer"
for action in {status,enable,start,status}; do
        echo " --> action: ${action}"
        systemctl $action docker;
        # TODO: maybe more adequate checks
done;

echo "--> Security Administration:"

##TODO: build logic for checking the zones:
##see if there is "docker" zone in
#firewall-cmd --get-zones
##see if interface "docker0" is in docker zone and if the docker zone is "active"
#firewall-cmd --get-active-zones
##if there is NO such zone (docker with docker0 interface) you can just add the docker's default interface (docker0) to the "trusted" zone
# echo " ** Adding docker's interface(docker0) to the network-firewall(firewall-cmd) in the \"trusted\" zone if not in a zone (docker)"
# firewall-cmd --add-interface=docker0 --zone trusted --permanent

echo " ** Firewall - enable port 8080 on the public network-interface"
firewall-cmd --add-port=8080/tcp --zone public --permanent

echo " ** Show current open to the network ports and network interfaces"
echo "--> public network-interface security"
firewall-cmd --zone public --list-all
echo "--> docker network-interface security"
firewall-cmd --zone docker --list-all

echo " ** Adding the $USER (vagrant) to the docker Group"
getent group docker;
# To Work hace to add the $USER(vagrant) to sudoers.d in advance
## usermod -aG docker $USER;
usermod -aG docker vagrant;
getent group docker;

### GITHUB rpm build installation
# echo " ** Installing lazydocker"
# mkdir -p /vagrant/Downloads && cd /vagrant/Downloads
# wget https://harbottle.gitlab.io/harbottle-main/7/x86_64/harbottle-main-release.rpm

# dnf install -y /vagrant/Downoads/harbottle-main-release.rpm
# dnf install -y lazydocker
# rm /vagrant/Downloads/harbottle-main-release.rpm
### END GITHUB rpm build installation

echo "** Additional packages installed for easier work with docker:"
echo "--> lazydocker - cli-gui for basic interaction with docker"
dnf copr enable -y atim/lazydocker
dnf install -y lazydocker

# SYSTEM UPDATE
echo "** Updating the system"
dnf update -y -x kernel\*

