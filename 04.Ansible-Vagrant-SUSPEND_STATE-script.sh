#!/usr/bin/env bash

cd '/home/vas/Documents/GitHub/DevOps-Basics_-_SoftUni'

cd 03.01.HW-docker-CentOS

vagrant status

# NOTE: check (VAGRANT STATE): if NOT (saved | running) running the X machines -> vagrant up X; ELSE vagrant resume
vagrant suspend
vagrant status

cd ../03.02.HW-docker-Ubuntu

# NOTE: chec (VAGRANT STATE)

vagrant status

vagrant suspend
vagrant status

cd ../03.03.HW-docker-OpenSUSE

vagrant status

vagrant suspend
vagrant status


cd ../