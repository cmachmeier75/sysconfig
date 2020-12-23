#!/bin/bash

echo "Installing PHP 8"
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php8.0
sudo apt-get install php8.0-curl php8.0-dev php8.0-gd php8.0-mbstring php8.0-zip php8.0-mysql php8.0-xml
php --version

echo "Installing Apache2"
sudo apt-get install apache2

