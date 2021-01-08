#!/bin/bash

echo "Configuring BASE PACKAGES.."

echo "Configuring openssh-'server'.."
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

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
sudo chmod a-w /etc/ssh/sshd_config.factory-defaults
echo "$sshd_config" > ~/sshd_config
sudo mv ~/sshd_config /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "Creating personal SSH-key.."
ssh-keygen -t rsa -b 4096

cat ~/.ssh/id_rsa
echo "^^^ ^^^ That's your SSH private key, store it securely! ^^^ ^^^"

echo "Updating firewall rules (SSH).."
sudo ufw allow ssh
sudo ufw enable
sudo ufw status
