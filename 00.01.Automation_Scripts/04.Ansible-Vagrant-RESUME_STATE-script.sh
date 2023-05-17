#!/usr/lib/env bash

cd '/home/vas/Documents/GitHub/DevOps-Basics_-_SoftUni'

cd 03.01.HW-docker-CentOS
pwd

vagrant status

# NOTE: check (VAGRANT STATE): if NOT (saved | running) running the X machines -> vagrant up X; ELSE vagrant resume
vagrant resume

cd ../03.02.HW-docker-Ubuntu
pwd
# NOTE: check (VAGRANT STATE);etc... for the rest of the machines

vagrant status

vagrant resume

cd ../03.03.HW-docker-OpenSUSE
pwd

vagrant status

vagrant resume


cd ../
pwd