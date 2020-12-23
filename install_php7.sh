#!/bin/bash

echo "Installing PHP 7.4"
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php7.4
sudo apt-get install php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml
php --version

echo "Installing Apache2"
sudo apt-get install apache2

