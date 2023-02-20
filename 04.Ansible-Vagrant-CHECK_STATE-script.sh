#!/usr/lib/env bash

RED='\033[0;31m'
POSITION="echo -e ${RED}$(pwd)"

cd '/home/vas/Documents/GitHub/DevOps-Basics_-_SoftUni'

cd 03.01.HW-docker-CentOS
$POSITION

vagrant status

cd ../03.02.HW-docker-Ubuntu
$POSITION
vagrant status

cd ../03.03.HW-docker-OpenSUSE
$POSITION
vagrant status

cd ../
$POSITION


# NOTE: loop it