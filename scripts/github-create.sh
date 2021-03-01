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
    echo "Repository name must exist (--name)"
    exit 1
fi

if [ -z "$USER_NAME" ]; then
    echo "Username must exist (--user)"
    exit 1
fi

if [ -z "$REPO_DEST" ]; then
    REPO_DEST="."
fi

curl -i https://api.github.com/user/repos\
     -u $USER_NAME \
     -X POST \
     -d "{\"name\":\"${REPO_NAME}\",\"description\":\"${REPO_DESC}\""

if [ $? -ne 0 ]; then
    echo "Error creating new repository! exiting..."
    exit 1
fi

cd ${REPO_DEST} && git clone git@github.com:${USER_NAME}/${REPO_NAME}.git