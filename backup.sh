#!/bin/bash
 
 SOURCE_DIR=$1
 DEST_DIR=$2
 DAYS=${3: -14}


USAGE(){
    echo -e "USAGE:: sh backup.sh <source> <destination> <days>"

}
 #check source and desination are provided

 if [ $# -lt 2 ]
 then
    USAGE 
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exists "
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR doesnt exists"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

if [ -n $FILES ]
then 
    echo "Files are found"
else
    echo "No files older than $DAYS"
fi