#!/usr/lib/env bash

RED='\033[0;31m'
PWD_COLORED_RED="echo -e ${RED}$(pwd)"

# Main Work-Dir path:
cd "/home/$USER/Documents/GitHub/DevOps-Basics_-_SoftUni" || exit

PARENT_DIR_PATH="03.Docker_Advanced"
cd "$PARENT_DIR_PATH" || exit

TARGET_DIRS=(	"03.01.HW-docker-CentOS" \
		"03.02.HW-docker-Ubuntu" \
		"03.03.HW-docker-OpenSUSE" )

for DIR in "${TARGET_DIRS[@]}";do
	cd "$DIR" || exit
	$PWD_COLORED_RED
	vagrant status
	cd ..
done