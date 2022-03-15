#!/usr/bin/env bash

echo "--> network create"
docker network create --driver bridge --subnet 10.0.50.0/24 --label v2-test-net-dob-M3-2a dob-net-v2

echo "--> volume create usable"
docker volume create --label test-v2-vol dob-php-v2-vol

echo "--> volume create un-necessary"
docker volume create --label test-v2-vol dob-mysql-v2-vol

echo "--> --> There is a lot of un-necessary commands (--add-host; --hostname; -v;)"
echo "--> mysql contianer to be addressed by the index.php when served"
docker container run -d \
--network dob-net-v2 --network-alias dob-mysql-v2 \                                            INSERT
--name con-mysql-v2 --hostname con-mysql-v2-hn \                                               INSERT
--add-host con-tst:10.0.50.20 \                                                                INSERT
-v dob-mysql-v2-vol:/mnt/some-mounted-vol \                                                    INSERT
-e MYSQL_ROOT_PASSWORD=12345 \                                                                 INSERT
img-mysql

echo "--> --> There is a lot of un-necessary commands (--add-host; --hostname;)"
echo "--> php container with the volume holding the index.php"
docker container run -d \     
--network dob-net-v2 --network-alias dob-php-v2 \
-p 8081:80 \                                
--name con-php-v2 --hostname con-php-v2-hn \                                                   INSERT
--add-host con-tst:10.0.50.20 \                                                                INSERT
-v dob-php-v2-vol:/var/www/html \                                                              INSERT
img-php 