#!/bin/bash

USERID=$(id -u)
echo "user ID is $USERID" 


if [ $USERID -ne 0 ]
then
    echo "please run the script with root privilages"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "git is not installed ,installing now"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo " git installation is not success check it"
     else
        echo "git installation is success"
    fi   
else
    echo "git is already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed, installing now"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql installation is not success check it"
        exit 1
    else
        echo "mysql installation is success"
    fi
else 
    echo "mysql is already installed"
fi
