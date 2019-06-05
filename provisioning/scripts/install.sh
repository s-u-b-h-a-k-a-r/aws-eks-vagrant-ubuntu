#!/bin/bash

cat >>/etc/hosts<<EOF
$1  $2  $3
EOF

apt-get update
apt-get install figlet  > /dev/null 2>&1
apt-get install curl    > /dev/null 2>&1
apt-get install git     > /dev/null 2>&1
apt-get install nano    > /dev/null 2>&1
apt-get install wget    > /dev/null 2>&1
apt-get install unzip   > /dev/null 2>&1
apt-get install systemd > /dev/null 2>&1
apt-get install jq      > /dev/null 2>&1

snap install yq      > /dev/null 2>&1

figlet docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y   > /dev/null 2>&1
sudo usermod -aG docker $USER


figlet ssh
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config