# aws-eks-vagrant-ubuntu
![enter image description here](https://lh3.googleusercontent.com/lfY7nctQEwJm8ZMrWFFnGdmTbAPdCUTNswuLA2TOGypDiBXhTmW70_oaaHSOMeRuUETZ5Cb3Xx4XEA)

# About...

This repository is used to create ***prerequisites*** that are required to ***access/create/delete*** ***Elastic Container Service For Kubernetes***.


# Table of Contents

* [Prerequisites](#prerequisites)
* [Install Vagrant Box](#deploy)
* [Vagrant Box Details](#configuration)
* [Create EKS cluster](#create)
* [Access EKS cluster](#eks)
* [Delete EKS cluster](#delete)
* [Add-Ons provided ](#addons)
* [Login Vagrant VM](#access)
* [Stop Vagrant VM](#stop)
* [Restart Vagrant VM](#restart)
* [Destroy Vagrant VM](#destroy)
* [Example](#example)


<a id="prerequisites"></a>

# Prerequisites 
* Enable Virtualization(VT) in BIOS for Hyper-V 
* [Git](https://git-scm.com/downloads "Git") command line utility which is used to target an existing repository and create a **clone**, or copy of the target repository
* [Vagrant (Version >= 2.2.0)](https://www.vagrantup.com/downloads.html "Vagrant") is an open-source software product for building and maintaining portable virtual software development environments, e.g. for VirtualBox, Hyper-V, Docker containers, VMware, and AWS
* [Oracle VM VirtualBox (Version >= 6.0)](https://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html "Oracle Virtual Manger") lets you run multiple operating systems on Mac OS, Windows, Linux, or Oracle Solaris.
* Minimum laptop/desktop configuration  - 8GBRAM , 4CPU , support for VT-X


<a id="deploy"></a>

# Install Vagrant Box
 Default settings:`env.yaml`. These settings can be changed as per your requirements and the below are minimum requirements.
```yaml
VM:
  ip: 100.10.10.109
  cpus: 2
  memory: 2048
  vmname: aws-eks-ubuntu
  hostname: aws-eks-ubuntu.com
```
Open `windows (OR) bash` terminal from your `local windows` machine

* `$ cd aws-eks-vagrant-ubuntu/provisioning` 
* `$ git clone https://github.com/SubhakarKotta/aws-eks-vagrant-ubuntu.git` 
* `$ vagrant up`

<a id="configuration"></a>
# Vagrant Box Details

Name|IP|OS|RAM|CPU|
|----|----|----|----|----|
aws-eks-ubuntu  |100.10.10.109|Ubuntu 18.04|2G|2|

<a id="create"></a>
# Create EKS Cluster

**Login to vagrant box from your local machine**

* `$ cd aws-eks-vagrant-ubuntu/provisioning`
* `$ vagrant ssh aws-eks-ubuntu`
* `$ sudo su`

**Provide AWS Credentials**

* `$ aws configure`
* `............... AWS Access Key ID [None]:`
* `............... AWS Secret Access Key [None]:`
* `............... Default region name [None]:`
* `............... Default output format [None]:`


**Create EKS Cluster**
 
* `$ eksctl create cluster --version=1.11 --name=<YOUR_CLUSTER_NAME> --region=<YOUR_REGION_NAME> --nodes-min=<MIN_NODES> --nodes-max=<MAX_NODES> --node-type=m4.xlarge --tags Owner=<YOUR_NAME>`

**Install Tiller**

* `$ kubectl --namespace kube-system create serviceaccount tiller `
* `$ kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller `
* `$ helm init --service-account tiller --upgrade `


**[Install kubernetes dashboard](https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html) by following the steps given in the link**

**[Access Kubernetes Dashboard](#access_dashboard) by following the steps given in the link**


<a id="access_dashboard"></a>

# Access Kubernetes Dashboard

From ***local*** system execute the below commands
* `$ ssh -L 8001:localhost:8001 vagrant@100.10.10.109` [***password : vagrant***]
* `$ sudo su`

Use the below command to generate ***access token*** login to ***Dashboard***
* `$ kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')`

Start proxy to access kubernetes dashboard
* `$ kubectl proxy`

***Click !***
[http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login](http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login)

![enter image description here](https://lh3.googleusercontent.com/bH5dzB7TtZ4AvURZz-841VHMsaMuC4vo9Jax0G7XID0XazoDpHcA3TA_SDKQEpXqL9-PupbXeElSKQ "EKS Kubernetes Dashboard")

***[![Watch the video]](https://youtu.be/vdT_ZVAEXok)***


<a id="eks"></a>

# Access EKS Cluster

**Login to vagrant box from your local machine**
* `$ cd aws-eks-vagrant-ubuntu/provisioning`
* `$ vagrant ssh aws-eks-ubuntu`
* `$ sudo su`

**Provide AWS Credentials**
* `$ aws configure`
* `............... AWS Access Key ID [None]:`
* `............... AWS Secret Access Key [None]:`
* `............... Default region name [None]:`
* `............... Default output format [None]:`

**Fetch/Update kubeconfig on your vagrant box**
* `$ aws eks --region <region> update-kubeconfig --name <cluster_name>`

**Verify Nodes**
* `$ kubectl get nodes` [Verify ***kubectl*** is connected to eks cluster]


**[Access Kubernetes Dashboard](#access_dashboard) by following the steps given in the link**

<a id="delete"></a>

# Delete EKS Cluster

**Login to vagrant box from your local machine**

* `$ cd aws-eks-vagrant-ubuntu/provisioning`
* `$ vagrant ssh aws-eks-ubuntu`
* `$ sudo su`

**Provide AWS Credentials**
* `$ aws configure`
* `............... AWS Access Key ID [None]:`
* `............... AWS Secret Access Key [None]:`
* `............... Default region name [None]:`
* `............... Default output format [None]:`

**Delete EKS Cluster**
When the cluster is no longer needed, use the eksctl delete cluster command to remove all the related resources.
* `$ eksctl delete cluster --name=<YOUR_CLUSTER_NAME> --region=<YOUR_REGION_NAME>`


<a id="addons"></a>
# Add-Ons provided
* `kubectl (1.11.5)`
* `aws-iam-authenticator`
* `aws-cli`
* `pip`
* `eksctl` (https://github.com/weaveworks/eksctl)
* `helm`

<a id="access"></a>

# Login Vagrant VM
**The Vagrant VM can be accessed in two ways from your local windows machine**

**vagrant ssh**
* `$ cd aws-eks-vagrant-ubuntu/provisioning`
* `$ vagrant ssh aws-eks-ubuntu`

**putty/mobaxterm**
* `100.10.10.109` [***vagrant/vagrant***]
	
          
<a id="stop"></a>

# Stop Vagrant VM
**Run the below command to stop the Vagrant Box from your local windows machine**

* `$ cd aws-eks-vagrant-ubuntu/provisioning`
* `$ vagrant halt`


<a id="restart"></a>

# Restart Vagrant VM
**Run the below command to restart the Vagrant Box if the vagrant box is stopped from your local windows machine**
* `$ cd aws-eks-vagrant-ubuntu/provisioning`
* `$ vagrant up`


<a id="destroy"></a>

# Destroy Vagrant VM
**Run the below command to delete the Vagrant Box from your local windows machine**
* `$ cd aws-eks-vagrant-ubuntu/provisioning`
* `$ vagrant destroy`


<a id="example"></a>

# Example
Here we will see a simple example creating a **EKS cluster** in **us-east-2** region

Understand the parameters that we are going to authenticate ***AWS***.
* `AWS Access Key <access key to authenticate AWS>`
* `AWS Secret Access Key <secret access key to authenticate AWS>`
* `Default Region name <region where we are going to create cluster>`
* `Default output format <we can leave this empty>`


Run the below command to authenticate ***AWS Credentials***

* `$ aws configure`
* `............... AWS Access Key ID [None]:AKIAI4MUM3N25AHL3O5Q`
* `............... AWS Secret Access Key [None]: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`
* `............... Default region name [None]: us-east-2`
* `............... Default output format [None]:`



Understand the parameters that we are going to pass to ***create EKS Cluster***
* `--version <Kubernetes Version that AWS Supports>`
* `--name <Name of the EKS Cluster>`
* `--region <Region that you are going to create cluster>`
* `--nodes-min <Mimimum number of EC2 instances in EKS Cluster>`
* `--nodes-min <Maximum number of EC2 instances in EKS Cluster>`
* `--node-type <The configuration of each EC2 machine with what CPU and MEMRORY should be>`
* `--tags <The tag that needs to be added in each resource that will be created with EKS Cluster i.e who added, what is the purpose etc>`

Run the below command to create ***new EKS Cluster***

* `$ eksctl create cluster --version=1.11 --name=my-pega-cluster --region=us-east-2 --nodes-min=2 --nodes-max=5 --node-type=m4.xlarge --tags Owner=pega`

To learn more about ***eksctl parameters*** please check the below link which has full details.
* `eksctl` (https://github.com/weaveworks/eksctl)
