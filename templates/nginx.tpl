#!/bin/bash
set -e
echo "*****    Installing Nginx    *****"
apt update
apt install -y nginx
ufw allow '${ufw_allow_nginx}'
systemctl enable nginx
systemctl restart nginx

echo "*****   Installation Complteted!!   *****"

echo "Welcome TDC - Transformation!!!" > /var/www/html

echo "*****   Startup script completes!!    *****"