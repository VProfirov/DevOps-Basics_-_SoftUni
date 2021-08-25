#!/bin/bash

echo "* Add hosts ..."
echo "192.168.99.100 db.dob.lab db" | tee -a /etc/hosts
echo "192.168.99.101 web.dob.lab web" | tee -a /etc/hosts

echo "* Install Software..."
dnf update -y
dnf install mariadb-server -y

echo "* Adjust MariaDB connectivity ..."
sudo sed -i.bak s/127.0.0.1/0.0.0.0/g /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mariadb

echo "* Create and load the database ..."
mysql -u root < /vagrant/db/db_setup.sql
