#!/bin/bash
 
#  for i in {0..216}
#  do
#     echo $i
# done

USERID=$(id -u)
echo "user ID is $USERID" 

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$3 is $R Failed $N"
        exit 1
    else
        echo -e "$3 is $G success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "please run the script with root privilages"
    exit 1
fi

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed installing it"
        dnf install $package -y
        VALIDATE$? "Installing $package"
    else
        echo "package already installed"
    fi
        
done