#!/bin/bash

echo "Installing PHP 8"
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php8.0 -y
sudo apt-get install php8.0-curl php8.0-dev php8.0-gd php8.0-intl php8.0-mbstring php8.0-zip php8.0-mysql php8.0-xml -y
php --version

user_bin_dir="/home/$(whoami)/bin"
if [ ! -d "$user_bin_dir" ]; then
    echo "Warning: Directory '$user_bin_dir' does not exist. Creating..."
    mkdir -p $user_bin_dir
fi

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=$user_bin_dir --filename=composer
rm composer-setup.php  
