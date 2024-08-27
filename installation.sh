#!/bin/bash

USERID=$(id -u)
echo "user ID is $USERID" 

if [ $USERID -ne 0 ]
then
    echo "please run the script with root privilages"
fi
dnf install git -y