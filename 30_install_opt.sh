#!/bin/bash

echo "Installing OPTIONAL PACKAGES.."

packages=( awscli chromium-browser gnome-tweaks lxappearance mc newsboat ranger qt5ct synaptic tmux vim )
for p in "${packages[@]}"; do
    echo " > $p";
    sudo apt-get install $p -y;
done

