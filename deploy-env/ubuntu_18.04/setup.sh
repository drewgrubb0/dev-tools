#!/bin/bash

sudo apt update

while [[ $# -gt 0 ]]
do
    case "$1" in
        --all)
            INSTALL_TOOLS="true"
            INSTALL_DEV="true"
            INSTALL_DEVOPS="true"
            INSTALL_CUSTOM_COMMANDS="true"
            INSTALL_WEB="true"
            INSTALL_DB="true"
            INSTALL_VIRTUAL_MACHINES="true"
            shift
            ;;
        --tools)
            INSTALL_TOOLS="true"
            shift
            ;;
        --dev)
            INSTALL_DEV="true"
            shift
            ;;
        --web)
            INSTALL_WEB="true"
            shift
            ;;
        --sec)
            INSTALL_SEC="true"
            shift
            ;;
        --devops)
            INSTALL_DEVOPS="true"
            shift
            ;;
        --db)
            INSTALL_DB="true"
            shift
            ;;
        --vms)
            INSTALL_VIRTUAL_MACHINES="true"
            shift
            ;;
        --custom)
            INSTALL_CUSTOM_COMMANDS="true"
            shift
            ;;
    esac
done

if [ "${INSTALL_TOOLS}" = "true" ]; then

    sudo apt install git -y
    sudo apt install curl -y
    sudo apt install jq -y
    sudo apt install redshift -y

    #Zsh
    sudo apt install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    #Docker
    sudo apt-get install apt-transport-https \
                         ca-certificates \
                         curl \
                         software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt-get update
    sudo apt-get install docker-ce -y

    sudo usermod -a -G docker $USER
    RESTART_RECOMMENDED="true"
fi

if [ "${INSTALL_DEV}" = "true" ]; then
    #Java
    sudo apt install openjdk-8-jdk -y
    sudo apt install openjdk-8-jre -y

    #Python
    sudo apt install python3 -y
    sudo apt install python3-pip -y
fi

if [ "${INSTALL_WEB}" = "true" ]; then
    #JavaScript
    sudo apt install nodejs -y
    sudo apt install npm -y

    #CSS/SASS
    sudo apt install sass -y
fi

if [ "${INSTALL_DEVOPS}" = "true" ]; then
    sudo apt install awscli -y

    # #Jenkins
    # wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    # echo "deb https://pkg.jenkins.io/debian binary/" | sudo tee -a /etc/apt/sources.list
    # sudo apt update
    # sudo apt install jenkins -y
fi

if [ "${INSTALL_DB}" = "true" ]; then
    sudo apt install mysql-server -y
fi

if [ "${INSTALL_VIRTUAL_MACHINES}" = true ]; then
    sudo apt install virtualbox -y
fi

if [ "${INSTALL_SEC}" = true ]; then
    sudo apt install wireshark -y
    sudo usermod -a -G wireshark $USER
    RESTART_RECOMMENDED="true"
fi

sudo apt update

if [ "${RESTART_RECOMMENDED}" = "true" ]; then
    echo "User permissions changed. A restart / relog is recommended to allow these changes to process :)"
fi