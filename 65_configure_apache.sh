#!/bin/bash

sudo mkdir b.ccnet.me
sudo mkdir m.ccnet.me
sudo mkdir n.ccnet.me
sudo mkdir r.ccnet.me
sudo mkdir s.ccnet.me
sudo mkdir v.ccnet.me
sudo mkdir www.ccnet.me

cd b.ccnet.me/ && sudo wget https://github.com/sabre-io/Baikal/releases/download/0.7.2/baikal-0.7.2.zip

cd ../r.ccnet.me/

sudo vim b.ccnet.me/index.html 
sudo cp b.ccnet.me/index.html m.ccnet.me/
sudo cp b.ccnet.me/index.html n.ccnet.me/
sudo cp b.ccnet.me/index.html r.ccnet.me/
sudo cp b.ccnet.me/index.html s.ccnet.me/
sudo cp b.ccnet.me/index.html v.ccnet.me/
sudo vim m.ccnet.me/index.html 
sudo vim n.ccnet.me/index.html 
sudo vim r.ccnet.me/index.html 
sudo vim s.ccnet.me/index.html 
sudo vim v.ccnet.me/index.html 

cd /etc/apache2/
sudo vim mods-enabled/dir.conf 
sudo a2enmod rewrite
sudo cp sites-available/000-default.conf sites-available/b-ccnet-me.conf
sudo vim sites-available/b-ccnet-me.conf
less sites-available/default-ssl.conf 
sudo cp sites-available/b-ccnet-me.conf sites-available/m-ccnet-me.conf 
sudo cp sites-available/b-ccnet-me.conf sites-available/n-ccnet-me.conf 
sudo cp sites-available/b-ccnet-me.conf sites-available/r-ccnet-me.conf 
sudo cp sites-available/b-ccnet-me.conf sites-available/s-ccnet-me.conf 
sudo cp sites-available/b-ccnet-me.conf sites-available/v-ccnet-me.conf 
sudo cp sites-available/b-ccnet-me.conf sites-available/www-ccnet-me.conf 
sudo vim sites-available/m-ccnet-me.conf
sudo vim sites-available/n-ccnet-me.conf
sudo vim sites-available/r-ccnet-me.conf
sudo vim sites-available/s-ccnet-me.conf
sudo vim sites-available/v-ccnet-me.conf
sudo vim sites-available/www-ccnet-me.conf
sudo a2ensite
sudo a2ensite b-ccnet-me m-ccnet-me n-ccnet-me r-ccnet-me s-ccnet-me v-ccnet-me www-ccnet-me
sudo vim /etc/hosts
217.160.214.184 b.ccnet.me
217.160.214.184 m.ccnet.me
217.160.214.184 n.ccnet.me
217.160.214.184 r.ccnet.me
217.160.214.184 s.ccnet.me
217.160.214.184 v.ccnet.me
217.160.214.184 www.ccnet.me ccnet.me

sudo ufw allow 'Apache Full'
sudo ufw status
sudo chown -R www-data *
sudo chgrp -R www-data *

sudo apt install certbot python3-certbot-apache
sudo certbot --apache
sudo systemctl status certbot.timer