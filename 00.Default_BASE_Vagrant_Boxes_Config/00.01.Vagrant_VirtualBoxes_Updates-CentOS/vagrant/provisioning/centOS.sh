#!/usr/bin/env bash
# the Vagrant provision runs this in "privileged" mode by default (privileged:true) == (sudo)
dnf update --exclude=kernel* -y
zplug update
omz update