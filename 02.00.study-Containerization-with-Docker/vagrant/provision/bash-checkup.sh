#!/usr/bin/env bash

echo '______________shell-start____________'

str="containerd.io.xxxx"

if [ ! -z "$(rpm -qa | grep -iE "opera")" ]; then 
	echo "HELLOOOOOO!";
	echo "$(rpm -qa | grep -iE "opera")";
fi



for i in {1,2,3}; do
	echo $i;
done