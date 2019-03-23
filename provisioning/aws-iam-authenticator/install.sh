#!/bin/bash
 
figlet authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
cp ./aws-iam-authenticator /home/vagrant/bin/aws-iam-authenticator && export PATH=/home/vagrant/bin:$PATH
echo 'export PATH=/home/vagrant/bin:$PATH' >> ~/.bashrc
aws-iam-authenticator help