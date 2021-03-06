#!/usr/bin/env bash

echo "* Add hosts ..."
echo "192.168.99.100 db.dob.lab db" | tee -a /etc/hosts
echo "192.168.99.101 web.dob.lab web" | tee -a /etc/hosts

echo "* Install Software ..."
apt-get update -y && apt-get upgrade -y
apt-get install -y apache2 php php-mysqlnd

echo "* Starting the httpd service - Apache Server"
systemctl start apache2
systemctl status apache2

echo "* Remove default data in the Apache's default directory"
rm /var/www/html/*
ls -lahtF /var/www/html

echo "* Data-source files are imported in to the machine by the Vagrant dir sharing (/vagrant/web)"
echo "* Copy web site files to /var/ww/html/ ..."
cp /vagrant/* /var/www/html
