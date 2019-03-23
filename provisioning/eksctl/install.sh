#!/bin/bash
 
figlet eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mkdir  -p /home/vagrant/bin && mv /tmp/eksctl /home/vagrant/bin && export PATH=/home/vagrant/bin:$PATH
echo 'export PATH=/home/vagrant/bin:$PATH' >> ~/.bashrc