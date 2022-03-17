#!/bin/bash

echo "* Add hosts ..."
echo "192.168.99.100 db.dob.lab db" | tee -a /etc/hosts
echo "192.168.99.101 web.dob.lab web" | tee -a /etc/hosts

echo "* Install Software..."
#dnf update -x kernel\* -y
zypper update
zypper install mariadb-server mariadb -y

echo "* Adjust MariaDB connectivity ..."
##TODO: check next line:
# sudo sed -i.bak s/127.0.0.1/0.0.0.0/g /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl enable mariadb
systemctl start mariadb
systemctl status mariadb
#systemctl restart mariadb
##TODO: check next line:
# sudo myql_secure_installation

echo "* Firewall opening for mariadb port 3306"
# TODO: CHECK if there is firewall-cmd no "sudo" needed -> the provisioning script runs with elevated privileges (as run by sudo)
firewall-cmd --add-port=3306/tcp --permanent
firewall-cmd --reload

echo "* Create and load the database ..."
## mysql -u root < /vagrant/db/data-source/db_setup.sql
# mysql -u root < /vagrant/db/db_setup.sql
mysql -u root < /vagrant/db_setup.sql