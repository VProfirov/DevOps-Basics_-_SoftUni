#!/usr/bin/env bash
# the Vagrant provision runs this in "privileged" mode by default (privileged:true) == (sudo)
zypper addrepo https://download.opensuse.org/repositories/home:arachnos/openSUSE_Leap_15.3/home:arachnos.repo
zypper refresh
zypper install python-iniconfig
zypper update

zplug update
omz update