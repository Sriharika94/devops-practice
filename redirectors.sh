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
    echo "please run the script with root privilages" &>>$LOG_FILE
    exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R Failed $N" &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is $G success" &>>$LOG_FILE
    fi
}

CHECK_ROOT