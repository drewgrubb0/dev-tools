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

cd ~
mkdir -p Projects
cd Projects
mkdir "$PROJECT_NAME"

if [ -x "$(command -v code)" ]; then
    cd "$PROJECT_NAME"
    code .
