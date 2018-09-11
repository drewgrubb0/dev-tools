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

//Docker
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce


# //Jenkins Preferred via Docker
# wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
# echo "deb https://pkg.jenkins.io/debian binary/" | sudo tee -a /etc/apt/sources.list
# sudo apt update
# sudo apt install jenkins -y

//Databases
sudo apt install mysql-server -y

//Zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo apt update