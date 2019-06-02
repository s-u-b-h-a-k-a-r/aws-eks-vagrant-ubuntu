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

figlet DOCKER
apt-get install docker.io      > /dev/null 2>&1


figlet SSH
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config