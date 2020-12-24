#!/bin/bash

echo "Configuring openssh-'server'.."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
sudo chmod a-w /etc/ssh/sshd_config.factory-defaults
read -r -d '' sshd_config <<'EOF'
PermitRootLogin no
MaxAuthTries 3
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
PasswordAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
UsePAM no
AllowAgentForwarding yes
AllowTcpForwarding no
X11Forwarding yes
PrintMotd no
TCPKeepAlive yes
MaxStartups 3
AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server
AllowUsers ubuntu 

EOF

sudo echo "$sshd_config" > /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "Creating personal SSH-key.."
ssh-keygen -t rsa -b 4096

cat ~/.ssh/id_rsa
echo "^^^ That's your SSH private key, store it securely!"
echo ""
echo "Adding your public SSH-key to 'authorized_keys'"
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

echo "Updating firewall rules (SSH).."
sudo ufw allow ssh
sudo ufw enable
sudo ufw status

echo "Configuring AWS"
# aws configure --profile cm

echo "Refreshing font-cache.."
fc-cache -fv

echo "Enabling Gnome Shell extensions.."
gsettings set org.gnome.shell disable-user-extensions false
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable no-title-bar@jonaspoehler.de