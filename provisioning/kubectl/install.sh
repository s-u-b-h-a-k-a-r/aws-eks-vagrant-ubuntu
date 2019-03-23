#!/bin/bash

figlet kubectl
curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir  -p /home/vagrant/bin && cp ./kubectl /home/vagrant/bin/kubectl && export PATH=/home/vagrant/bin:$PATH
echo 'export PATH=/home/vagrant/bin:$PATH' >> ~/.bashrc
kubectl version --short --client
