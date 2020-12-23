#!/bin/bash

echo "Installing NodeJS"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
node -v
npm -v

echo "Installing gulp"
sudo npm install gulp-cli -g
npm install gulp -D
gulp --version
