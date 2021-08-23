#!/bin/bash
set -e
echo "*****    Installing Nginx    *****"
apt update
apt install -y nginx
ufw allow '${ufw_allow_nginx}'
systemctl enable nginx
systemctl restart nginx

echo "*****   Installation Complteted!!   *****"

tee  /var/www/html/index.nginx-debian.html << EOF
<!DOCTYPE html>
<html>
<head>
<title>Netbr!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to TDC-Transformation!</h1>
<p>Este eh um exemplo de infraestrutura simples com o Terraform.</p>

</body>
</html>
EOF

echo "*****   Startup script completes!!    *****"