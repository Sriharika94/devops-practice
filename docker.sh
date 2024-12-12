#!/bin/bash

USERID=$(id -u)
echo "user ID is $USERID" 

if [ $USERID -ne 0 ]
then
    echo "please run the script with root privilages"
    exit 1
fi

dnf list installed docker
if [ $? -ne 0 ]
then 
    echo "docker is not installed ,installing now"
    dnf -y install dnf-plugins-core
    dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
    sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    if [ $? -ne 0 ]
    then
        echo " dockerit installation is not success check it"
     else
        echo "docker installation is success"
    fi   
else
    echo "docker is already installed"
fi
