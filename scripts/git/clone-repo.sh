#!/usr/bin/env bash

PROJECT_NAME=$1

if [ -z $PROJECT_NAME ]; then
    read -p "Please enter the project name: " PROJECT_NAME
fi

cd ~/Projects

if [ $? -ne 0 ]; then
    mkdir ~/Projects
fi

git clone git@github.com:drewgrubb0/${PROJECT_NAME}.git

echo "Cloned ${PROJECT_NAME} into Projects"
exit 0