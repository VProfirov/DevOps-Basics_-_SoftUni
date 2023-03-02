#!/bin/usr/env bash

# target="03.01.HW-docker-CentOS"
# path=./$target/vagrant/

cd ~/
cp -rv {bash_history,.bash_history,.zsh_history} /vagrant/cli_history

cd /vagrant/cli_history
ln -s /vagrant/cli_history{bash_history,.bash_history,.zsh_history} ~/
