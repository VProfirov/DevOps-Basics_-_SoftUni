#!/bin/usr/env bash

# target="03.01.HW-docker-CentOS"
# path=./$target/vagrant/

echo "This script should be executed from within the managed Vagrant_box/Virtualbox."

echo "The persumed $USER is 'vagrant'"

cd /home/"$USER" || return
cp -rv {bash_history,.bash_history,.zsh_history} /vagrant/cli_history

cd /vagrant/cli_history || return
ln -s /vagrant/cli_history{bash_history,.bash_history,.zsh_history} /home/"$USER"
