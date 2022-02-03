#!/usr/bin/env bash

# Takes the first passed arg
new_port=$1
# defaults back to port 80
nginx_port_export=${new_port:=80}

# echo "$nginx_port_export"

sed "s/listen       80;/listen       ${nginx_port_export};" /etc/nginx/nginx.conf

#If we need CLI-interaction use: read nginx_PORT