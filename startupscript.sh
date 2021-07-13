#!/bin/bash
sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo apt-get -y update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    wget \
    unzip
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
cd /home/deployer/
wget https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.zip
unzip apache-tomcat-9.0.50.zip
chown -Rvf deployer:deployer *
