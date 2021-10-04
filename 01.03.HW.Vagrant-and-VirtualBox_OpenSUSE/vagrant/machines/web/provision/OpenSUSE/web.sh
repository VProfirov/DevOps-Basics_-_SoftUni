#!/usr/bin/env bash

echo "* Add hosts ..."
echo "192.168.99.100 db.dob.lab db" | tee -a /etc/hosts
echo "192.168.99.101 web.dob.lab web" | tee -a /etc/hosts

echo "* Install Software ..."
#dnf update -x kernel\* -y
zypper update -y
zypper install httpd php php-mysqlnd git -y

echo "* Starting the httpd service - Apache Server"
systemctl enable httpd
systemctl start httpd
systemctl status httpd

echo "* Firewall opening for httpd.service/Apache2"
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload

echo "* SeLinux configuration for httpd"
sudo setsebool -P httpd_can_network_connect=1
# If SeLinux blocks some functionality change mode in --> /etc/sysconfig/selinux

echo "* Remove default data in the Apache's default directory"
## TODO: check next line:
rm -fr /var/www/html/*
ls -lahtF /var/www/html

echo "* Data-source files are imported in to the machine by the Vagrant dir sharing (/vagrant/web)"
echo "* Copy web site files to /var/ww/html/ ..."
# cp /vagrant/web/* /var/www/html
cp /vagrant/* /var/www/html

