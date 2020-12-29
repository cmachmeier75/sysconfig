#!/bin/bash

# OPTIONAL PACKAGES
echo "Installing OPTIONAL PACKAGES.."
packages=( awscli chromium-browser gnome-tweaks lxappearance mc newsboat synaptic tmux vim )
for p in "${packages[@]}"; do
    echo " > $p";
    sudo apt-get install $p -y;
done

# CUSTOM PACKAGES
echo "Adding CUSTOM PACKAGE REPOS.."
echo " > Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
yes "" | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo " > Ghostwriter"
yes "" | sudo add-apt-repository ppa:wereturtle/ppa

echo " > Handbrake"
yes "" | sudo add-apt-repository ppa:stebbins/handbrake-releases

echo " > KeePassXC"
yes "" | sudo add-apt-repository ppa:phoerious/keepassxc

echo " > OpenVPN"
curl -fsSL https://swupdate.openvpn.net/repos/repo-public.gpg| sudo apt-key add -
yes "" | sudo add-apt-repository "deb http://build.openvpn.net/debian/openvpn/stable focal main"

echo " > Signal"
curl -fsSL https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
yes "" | sudo add-apt-repository "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main"

echo " > Spotify"
curl -fsSL https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
yes "" | sudo add-apt-repository "deb http://repository.spotify.com stable non-free"

echo " > Syncthing"
curl -fsSL https://syncthing.net/release-key.txt | sudo apt-key add -
yes "" | sudo add-apt-repository "deb https://apt.syncthing.net/ syncthing stable"

echo " > VSCodium"
curl -fsSL https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg 
yes "" | sudo add-apt-repository "deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main"

echo "Refreshing list of packages.."
sudo apt-get update -y

echo "Installing CUSTOM PACKAGES.."
echo " > Docker"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo " > Ghostwriter"
sudo apt-get install ghostwriter -y

echo " > Handbrake"
sudo apt-get install handbrake-gtk -y

echo " > KeePassXC"
sudo apt-get install keepassxc -y

echo " > OpenVPN"
sudo apt-get install openvpn -y

echo " > Signal"
sudo apt-get install signal-desktop -y

echo " > Skype"
curl -fSL https://go.skype.com/skypeforlinux-64.deb > skypeforlinux-64.deb
sudo apt install ./skypeforlinux-64.deb -y
rm ./skypeforlinux-64.deb

echo " > Spotify"
sudo apt-get install spotify-client -y
echo " > Spicetify"
mkdir ~/bin/ && cd ~/bin/
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
cd ~

echo " > Syncthing"
sudo apt-get install syncthing -y

echo " > VSCodium"
sudo apt-get install codium -y
