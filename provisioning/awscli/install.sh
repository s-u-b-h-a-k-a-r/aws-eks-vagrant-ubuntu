#!/bin/bash
 
figlet pip
curl -O https://bootstrap.pypa.io/get-pip.py
python  get-pip.py --user
export PATH=~/.local/bin:$PATH

figlet pip version
pip --version

figlet aws-cli
pip install awscli --upgrade --user
aws --version
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc