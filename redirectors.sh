#!/bin/bash

LOGS_FOLDER="/var/log/shell-script/"
SCRIPT_NAME=$( echo "$0" |cut -d "." -f1 )
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)


R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo "please run the script with root privilages" | tee -a &>>$LOG_FILE
    exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R Failed $N" | tee -a &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is $G success" | tee -a &>>$LOG_FILE
    fi
}
USAGE(){
    echo "USAGE: sudo sh redirectors.sh package1 package2..."
    exit 1
}
if [ $# -eq 0 ]
then
    USAGE
fi

CHECK_ROOT

for package in $@
do
    dnf list installed $package | tee -a &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed installing it" | tee -a &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo "package already installed" | tee -a &>>$LOG_FILE
    fi
        
done