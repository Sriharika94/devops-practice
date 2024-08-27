#!/bin/bash

USERID=$(id -u)
echo "user ID is $USERID" 
dnf install git -y