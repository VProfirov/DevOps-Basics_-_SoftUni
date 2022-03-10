#!/usr/bin/env bash

echo "--> Context env creation/copy"
mkdir -p /home/docker
cp /vagrant/M3-Practice-Advanced-Docker-Files/M3-2a /home/docker/

echo "--> Image build of MySQL image"
# docker image build -t img-mysql /vagrant/M3-Practice-Advanced-Docker-Files/M3-2a/mysql/
# Dockerfile in: /home/docker/M3-2a/mysql
docker image build -t img-mysql /home/docker/M3-2a/mysql/

echo "--> Image build of PHP image"
# docker image build -t img-php /vagrant/M3-Practice-Advanced-Docker-Files/M3-2a/php
# Dockerfile in: /home/docker/M3-2a/php
docker image build -t img-php /home/docker/M3-2a/php/

echo "--> Network creation (dob-network)"
docker network create --driver bridge --subnet 10.0.1.0/24 --label dob-network dob-network

echo "--> Creating con MySQL"
docker container run -d --network dob-network --network-alias dob-mysql -e MYSQL_ROOT_PASSWORD=12345 --name con-mysql img-mysql

echo "--> Creating con PHP"
docker container run -d --network dob-network --network-alias dob-php -p 8080:80 \
-v /home/docker/M3-2a:/var/www/html --name con-php img-php

echo "--> PHP page content check"
wget localhost:8080
cat index.html

## loclahost --> 192.168.99.130:8080
