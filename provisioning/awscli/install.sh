#!/bin/bash
 
figlet pip
apt-get install awscli -y
apt-get install python3-pip -y
pip3 install awscli --upgrade --user
aws --version
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc