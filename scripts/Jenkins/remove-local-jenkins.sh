#!/bin/bash

sudo docker stop jenkins-master
sudo docker rm jenkins-master

sudo docker rmi myjenkins
sudo docker rmi jenkins/jenkins

sudo docker volume rm jenkins-data
sudo docker volume rm jenkins-log
