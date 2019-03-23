#!/bin/bash

figlet HELM

export PATH=/usr/local/bin:/home/vagrant/bin:$PATH
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
chmod +x get_helm.sh
./get_helm.sh

cp  /usr/local/bin/helm /home/vagrant/bin/helm
cp  /usr/local/bin/tiller /home/vagrant/bin/tiller