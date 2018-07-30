#!/bin/bash

sudo apt update

//General
sudo apt install git -y
sudo apt install curl -y
sudo apt install jq -y
sudo apt install redshift -y

//Java
sudo apt install openjdk-8-jdk -y
sudo apt install openjdk-8-jre -y

//JavaScript
sudo apt install nodejs -y
sudo apt install npm -y

//Python
sudo apt install python3 -y
sudo apt install python3-pip -y

//Devops
sudo apt install awscli -y
sudo npm install -g serverless -y
sudo snap install docker

//Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian binary/" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install jenkins -y

//Databases
sudo apt install mysql-server -y

sudo apt update