#!/bin/bash

echo ""
openssl
openssh-server

echo "Updating firewall rules (SSH)"
sudo ufw allow ssh
sudo ufw enable
sudo ufw status

echo "Configuring AWS"
aws configure --profile cm


echo "Enabling Gnome Shell extensions"
gsettings set org.gnome.shell disable-user-extensions false
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable no-title-bar@jonaspoehler.de