#!/bin/bash

echo "Cloning dotFiles"
git clone --bare git@bitbucket.org:cmachmeier/dotfiles.git $HOME/.dotFiles
source $HOME/.bashrc
dotty config --local status.showUntrackedFiles no
dotty checkout

echo "Cloning sys.config"
md $HOME/Repositories/ccnet.sys.config/
git clone git@bitbucket.org:cmachmeier/ccnet.sys.config.git $HOME/Repositories/

echo "Updating firewall rules (SSH)"
sudo ufw allow ssh
sudo ufw enable
sudo ufw status

echo "Configuring AWS"
# aws configure --profile funanga
