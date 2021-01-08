#!/bin/bash

echo "UPDATING SYSTEM.."
sudo apt-get update -y
sudo apt-get full-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean

echo "Installing BASE PACKAGES.."
packages=( apt-transport-https ca-certificates curl gcc gnupg-agent make perl openssh-server openssl software-properties-common ufw zip )
for p in "${packages[@]}"; do
    echo " > $p";
    sudo apt-get install $p -y;
done
