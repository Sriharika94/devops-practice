#!/bin/bash

USERID=$(id -u)
echo "user ID is $USERID" 

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R Failed $N"
        exit 1
    else
        echo -e "$2 is $G success"
}


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
    VALIDATE $? "Installing git"
else 
    echo "Git is already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed, installing now"
    dnf install mysql -y
    VALIDATE $? "Installing mysql"

else 
    echo "mysql is already installed"
fi