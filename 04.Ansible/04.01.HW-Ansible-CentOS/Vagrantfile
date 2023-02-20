# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
  config.ssh.insert_key = false

  config.vm.define "ans" do |ans|
    ans.vm.box = "VProfirov/CentOS-Stream-08-customized"
    ans.vm.hostname = "ans.dob.lab"
    ans.vm.network "private_network", ip: "192.168.98.200"
    ans.vm.synced_folder "vagrant/", "/vagrant"
  end

  config.vm.define "web" do |web|
    web.vm.box = "VProfirov/CentOS-Stream-08-customized"
    web.vm.hostname = "web.dob.lab"
    web.vm.network "private_network", ip: "192.168.98.201"
    web.vm.network "forwarded_port", guest: 80, host: 8080
  end

  config.vm.define "db" do |db|
    db.vm.box = "VProfirov/CentOS-Stream-08-customized"
    db.vm.hostname = "db.dob.lab"
    db.vm.network "private_network", ip: "192.168.98.202"
  end

  config.vm.define "clnt" do |clnt|
    clnt.vm.box = "VProfirov/CentOS-Stream-08-customized"
    clnt.vm.network "private_network", ip: "192.168.98.203"
    clnt.vm.hostname = "clnt.dob.lab"
  end
 
end
