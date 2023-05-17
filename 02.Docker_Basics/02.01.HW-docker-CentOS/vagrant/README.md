# NOTES #CONTAINERIZATION
uninstalling: podman runc *buildah*(not-defaultly-installed)* -> reason: conflicts with docker

## In order to install docker:
1. Clean pre-existing conflicting containerization software
	sudo dnf remove podman buildah runc
2. Enable docker repos(if needed)
   sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
3. Try removing pre-existing docker rpm's
   1. sudo dnf remove docker*
   2. List of expected old docker modules/rpms :
	sudo dnf remove docker docker-client docker-client-latest \
                docker-common docker-latest docker-latest-logrotate \
                docker-logrotate docker-selinux docker-engine-selinux docker-engine
4. Install docker-ce docker-ce-cli containerd.io(<- if it is not part of the package add the rpm manually)
	sudo dnf install docker-ce docker-ce-cli

	NOTE: for CentOS, RHEL and Fedora the containerd.io is part of the docker-ce rpm

	NOTE: if doesnt exist in the rpm use:

	sudo dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages\
     /containerd.io-1.2.13-3.1.el7.x86_64.rpm

5. Enable + Start Docker
   1. code-block:
	for $action in {"status", "enable", "start", "status"}:
	do
	   systemctl $action docker;
	done
6. Add $USER to the docker group
   1. sudo usermod -aG docker $USER