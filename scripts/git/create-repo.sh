#!/bin/bash

#Parse Arguments
while [[ $# -gt 0 ]]
do
    case $1 in
        --name)
            REPO_NAME="$2"
            shift
            shift
            ;;
        --desc)
            REPO_DESC="$2"
            shift
            shift
            ;;
        --dest)
            REPO_DEST="$2"
            shift
            shift
            ;;
        --user)
            USER_NAME="$2"
            shift
            shift
            ;;
    esac
done
if [ -z "$REPO_NAME" ]; then
    echo "Repository name must exist"
    exit 1
fi

if [ -z "$USER_NAME" ]; then
    echo "Username must exist"
    exit 1
fi

if [ -z "$REPO_DEST" ]; then
    REPO_DEST="."
fi

curl -i -u $USER_NAME https://api.github.com/user/repos