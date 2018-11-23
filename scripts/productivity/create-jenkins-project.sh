#!/bin/bash

#Parse Arguments
while [[ $# -gt 0 ]]
do
    case $1 in
        --name)
            PROJECT_NAME="$2"
            shift
            shift
            ;;
    esac
done

if [ -z "$PROJECT_NAME" ]; then
    read -p "Please enter a project name:" PROJECT_NAME
fi

mkdir -p ~/Projects
cd ~/Projects
mkdir $PROJECT_NAME
cd ./$PROJECT_NAME

#Create initial directory structure
mkdir -p devops/docker-image
mkdir -p devops/deployment
mkdir -p src/main
mkdir -p src/test
mkdir -p local/
touch README.txt
touch devops/JenkinsFile