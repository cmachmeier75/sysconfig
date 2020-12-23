#!/bin/bash

echo "Updating system"
sudo apt-get update -y && \
sudo apt-get upgrade -y && \
sudo apt-get autoremove && \
sudo apt-get autoclean

sudo do-release-update


echo "Installing OpenSSL/zip"
sudo apt-get install openssl zip git

echo "Cloning dotFiles"
git clone --bare git@bitbucket.org:cmachmeier/dotfiles.git $HOME/.dotFiles
source $HOME/.bashrc
dotty config --local status.showUntrackedFiles no
dotty checkout

echo "Cloning sys.config"
md $HOME/Repositories/ccnet.sys.config/
git clone git@bitbucket.org:cmachmeier/ccnet.sys.config.git $HOME/Repositories/

echo "Installing perl, gcc, .."
sudo apt install gcc make perl vim synaptic gnome-tweaks openssh-server ufw

echo "Installing awscli"
sudo apt-get install awscli
aws --version
