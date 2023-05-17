#!/bin/usr/env bash

# NOTE: add this to the OpenSUSE and Ubunutu  provisioning

echo "** Exporting .zsh_history; .bash_history and bash_history as symlinks from within the shared /vagrant{/cli_history}"

if [ -d /vagrant ] && [ ! -d /vagrant/cli_history ];then
        mkdir -p /vagrant/cli_history

        cp -rv /home/vagrant/.zsh_history /vagrant/cli_history;
        cp -rv /home/vagrant/.bash_history /vagrant/cli_history;
        cp -rv /home/vagrant/bash_history /vagrant/cli_history;
fi

if [ ! -h /home/vagrant/.zsh_history ] && [ ! -h /home/vagrant/.bash_history ] && [ ! -h /home/vagrant/bash_history ];then
        rm /home/vagrant/.zsh_history
        rm /home/vagrant/.bash_history
        rm /home/vagrant/-fr bash_history

        ln -s /vagrant/cli_history/.zsh_history /home/vagrant/.zsh_history;
        ln -s /vagrant/cli_history/.bash_history /home/vagrant/.bash_history;
        ln -s /vagrant/cli_history/bash_history /home/vagrant/bash_history;
fi