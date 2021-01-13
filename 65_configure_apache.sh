#!/bin/bash

echo "Configuring APACHE HTTP SERVER.."

for i in b m n r s v www; do

    echo "Creating document_root for '"$i".ccnet.me'.."
    cd /srv/
    sudo mkdir ./"$i".ccnet.me

    read -r -d '' indexhtml <<'EOF'
<!DOCTYPE html PUBLIC
    "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>This page was intentionally left blank</title>
        <style type="text/css">
        * { margin: 0; padding: 0; }
        body, html { padding: 3px; background-color: #D8DBE2; font-family: 'Open Sans', sans-serif; }
        </style>
    </head>
    <body>
        <h1>This page was intentionally left blank</h1>
        <p>($i.ccnet.me)</p>
    </body>
</html>

EOF

    echo "$indexhtml" > ~/index.html
    sudo mv ~/index.html ./"$i".ccnet.me/index.html
    
    echo "Creating virtual_host-config for '"$i".ccnet.me'.."
    cd /etc/apache2/sites-available/

    read -r -d '' vhostconf <<'EOF'
<VirtualHost *:80>
    ServerName $i.ccnet.me
    ServerAdmin webmaster@ccnet.me
    DocumentRoot /srv/$i.ccnet.me
    <Directory /srv/$i.ccnet.me/>
        Options Indexes MultiViews FollowSymlinks
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    RewriteEngine on
    RewriteCond %{SERVER_NAME} =$i.ccnet.me
    RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>

EOF

    echo "$vhostconf" > ~/vhostconf
    sudo mv ~/vhostconf ./"$i"-ccnet-me.conf
    sudo a2ensite "$i"-ccnet-me

    echo "Creating 'hosts'-entry for '"$i".ccnet.me'.."
    echo "217.160.214.184 $i.ccnet.me$(cat /etc/hosts)" > ~/hosts.new
    sudo mv ~/hosts.new /etc/hosts

done;

echo "Disabling default sites.."
sudo a2dissite 000-default
sudo a2dissite default-ssl

echo "Enabling mod_rewrite.."
sudo a2enmod rewrite

echo "Setting file permissions for user 'www-data'.."
sudo chown -R www-data /srv/*
sudo chgrp -R www-data /srv/*

echo "Reloading Apache config.."
sudo apache2ctl configtest
sudo systemctl reload apache2

echo "Updating firewall rules (Apache).."
sudo ufw allow 'Apache Full'
sudo ufw status

echo "Installing certbot.."
sudo apt install certbot python3-certbot-apache

echo "Running certbot.."
sudo certbot --apache
sudo systemctl status certbot.timer