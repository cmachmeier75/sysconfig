#!/bin/bash

# SYSTEM UPDATE
echo "UPDATING SYSTEM.."
sudo apt-get update -y
sudo apt-get full-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean


# SYSTEM UPGRADE
echo "UPGRADING DISTRIBUTION RELEASE.."
sudo do-release-update


# BASE PACKAGES
echo "Installing BASE PACKAGES.."
base_packages=( apt-transport-https ca-certificates curl gnupg-agent software-properties-common openssl zip )
for bp in "${base_packages[@]}"; do
    echo " > $bp";
    sudo apt-get install $bp -y;
done


# OPTIONAL PACKAGES
echo "Installing OPTIONAL PACKAGES.."
opt_packages=( gcc make perl vim synaptic gnome-tweaks openssh-server ufw awscli )
for op in "${opt_packages[@]}"; do
    echo " > $op";
    sudo apt-get install $op -y;
done


# CUSTOM PACKAGES
echo "Adding CUSTOM PACKAGE REPOS.."
echo " > OpenVPN"
curl -fsSL https://swupdate.openvpn.net/repos/repo-public.gpg| sudo apt-key add -
yes "" | sudo add-apt-repository "deb http://build.openvpn.net/debian/openvpn/stable focal main"

echo " > Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
yes "" | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo " > Signal"
curl -fsSL https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
yes "" | sudo add-apt-repository "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main"

echo " > KeePassXC"
yes "" | sudo add-apt-repository ppa:phoerious/keepassxc

echo " > VSCodium"
curl -fsSL https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg 
yes "" | sudo add-apt-repository "deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main"

echo " > Spotify"
curl -fsSL https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
yes "" | sudo add-apt-repository "deb http://repository.spotify.com stable non-free"

echo " > Handbrake"
yes "" | sudo add-apt-repository ppa:stebbins/handbrake-releases

echo " > Ghostwriter"
yes "" | sudo add-apt-repository ppa:wereturtle/ppa

echo " > Syncthing"
curl -fsSL https://syncthing.net/release-key.txt | sudo apt-key add -
yes "" | sudo add-apt-repository "deb https://apt.syncthing.net/ syncthing stable"

echo "Refreshing list of packages.."
sudo apt-get update -y

echo "Installing CUSTOM PACKAGES.."
echo " > Skype"
curl -fSL https://go.skype.com/skypeforlinux-64.deb > skypeforlinux-64.deb
sudo apt install ./skypeforlinux-64.deb -y
rm ./skypeforlinux-64.deb

echo " > OpenVPN"
sudo apt-get install openvpn -y

echo " > Docker"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo " > Signal"
sudo apt-get install signal-desktop -y

echo " > KeePassXC"
sudo apt-get install keepassxc -y

echo " > VSCodium"
sudo apt-get install codium -y

echo " > Spotify"
sudo apt-get install spotify-client -y
echo " > Spicetify"
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
mkdir ~/bin/
mv ~/spicetify-cli/ ~/bin/

echo " > Handbrake"
sudo apt-get install handbrake-gtk -y

echo " > Ghostwriter"
sudo apt-get install ghostwriter -y

echo " > Syncthing"
sudo apt-get install syncthing -y
