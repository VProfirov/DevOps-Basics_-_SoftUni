!/usr/bin/env bash

# SYSTEM PROVISION PHASE
echo " ** Add hosts..."
echo "192.168.99.102 docker.dob.lab docker" | tee -a /etc/hosts

## CLEANUP PHASE - cleanup runc - the pre-installed conflicts with docker. Also RHEL's podman also, but there is none in UBUNTU
echo "** Trying to remove pre-existing docker packages"
apt-get remove docker docker-engine docker.io containerd runc

# APPLICATION PROVISION PHASE
echo "** Set up the repository: Update the apt package index and install packages to allow apt to use a repository over HTTPS:"
apt-get update
apt-get upgrade

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo " ** Enable docker repo gpg keys"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo " ** Enable docker stable repo"
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo " ** Installing docker packages"
apt update
apt install -y docker-ce docker-ce-cli containerd.io


echo " ** Enable + Start Docer"
for action in {status,enable,start,status}; do
        echo " --> action: ${action}"
        systemctl $action docker;
        # TODO: maybe more adequate checks
done;

# NOTE: si there an " ** Firewall" equivalent for Ubuntu (preinstalled?)

echo " ** Adding the $USER (vagrant) to the docker Group"
getent group docker;
# To Work hace to add the $USER(vagrant) to sudoers.d in advance
## usermod -aG docker $USER;
usermod -aG docker vagrant;
getent group docker;


echo "** Adding some CMD Tools like (tree; bat; etc...)"
sudo apt install tree -y

