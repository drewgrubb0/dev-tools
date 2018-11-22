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
    echo "A project name under --name is required"
    79
    exit 1
fi

cd ~
mkdir -p Projects
cd Projects
mkdir "$PROJECT_NAME"

if [ -x "$(command -v code)" ]; then
    cd "$PROJECT_NAME"
    code .
fi