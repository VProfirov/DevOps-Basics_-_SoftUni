#!/usr/bin/env bash
# the Vagrant provision runs this in "privileged" mode by default (privileged:true) == (sudo)
zypper update -y
zplug update
omz update