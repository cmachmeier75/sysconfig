#!/bin/bash

echo "Installing OPTIONAL PACKAGES.."

packages=( chromium-browser gnome-tweaks imagemagick lxappearance mc newsboat ranger qt5ct synaptic tmux )
for p in "${packages[@]}"; do
    echo " > $p";
    sudo apt-get install $p -y;
done

