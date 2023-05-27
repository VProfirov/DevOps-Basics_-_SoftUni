#!/usr/bin/env bash

# NOTE: add this to the OpenSUSE and Ubunutu  provisioning

echo "** Exporting .zsh_history; .bash_history and bash_history as symlinks from within the shared /vagrant{/cli_history}"

if [ -d /vagrant ] && [ ! -d /vagrant/cli_history ];then
        echo "cli_history is not existing or is a file. Clearing (by in-dir mv "*.cleared_file") and deploying cli_history as a dir holding the vbox's shared and synced shell history"

        if [ -f /vagrant/cli_history ]; then
                mv /vagrant/cli_history /vagrant/cli_history.cleared_file
        fi
        mkdir -p /vagrant/cli_history

        cp -rv /home/vagrant/.zsh_history /vagrant/cli_history;
        cp -rv /home/vagrant/.bash_history /vagrant/cli_history;
        cp -rv /home/vagrant/bash_history /vagrant/cli_history;
fi

if [ ! -h /home/vagrant/.zsh_history ] && [ ! -h /home/vagrant/.bash_history ] && [ ! -h /home/vagrant/bash_history ];then

        echo 'removing /home/$USER/*_history and ln -s from /vagrant/cli_history/*'

        rm /home/vagrant/.zsh_history
        rm /home/vagrant/.bash_history
        rm -fr /home/vagrant/bash_history

        # NOTE: the fallowing single line become uselss due to the zsh_init (fix?)
        ln -s /vagrant/cli_history/.zsh_history /home/vagrant/.zsh_history;
        ln -s /vagrant/cli_history/.bash_history /home/vagrant/.bash_history;
        ln -s /vagrant/cli_history/bash_history /home/vagrant/bash_history;

        # NOTE: on the next vagrant ssh the .zsh_history is re-written and I should export the HISTFILE=/vagrant/cli... and source the .zshrc
fi

echo "** redirecting the HISTFILE through .zshrc: /vagrant/cli_history/.zsh_history (HOME->$HOME)"
grep -E "HISTFILE=" $HOME/.zshrc || echo 'export HISTFILE="/vagrant/cli_history/.zsh_history"' || tee -a $HOME/.zshrc
# ls -lahtF /vagrant
# ls -lahtF /vagrant/cli_history

# ls -lahtF /vagrant/cli_history/.zsh_history
# # chmod go-rw /vagrant/cli_history/.zsh_history
# ls -lahtF /vagrant/cli_history/.zsh_history

# NOTE: The zsh_init is over-writing the $HISTFILE, so the zshrc should export it everytime --> needs a sed-check in the .zshrc for the HISTFILE="/vagrant/..."
# cd /vagrant/cli_history;pwd;
# echo "HISTFILE --> $HISTFILE"
# #source HISTFILE="/vagrant/cli_history/.zsh_history"
# export HISTFILE="/vagrant/cli_history/.zsh_history"
# echo "HISTFILE --> $HISTFILE"