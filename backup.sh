#!/bin/bash
 
 SOURCE_DIR=$1
 DEST_DIR=$2
 DAYS=${3:-14}
 TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)


USAGE(){
    echo  "USAGE:: sh backup.sh <source> <destination> <days>"

}
 #check source and desination are provided

 if [ $# -lt 2 ]
 then
    USAGE 
    exit 1
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
echo "Files: $FILES"


if [ ! -z $FILES ]
then 
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    if [ -f $ZIP_FILE ]
    then
        echo "Succesfully zipped files"
        while IFS= read -r file
        do
            echo "deleting file: $file"
            rm -rf $file
        done <<< $FILES

    else
        echo "zipping failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi

