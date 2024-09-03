#!/bin/bash
 
 SOURCE_DIR=$1
 DEST_DIR=$2
 DAYS=${3: -14}
 TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)


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


if [ ! -z $FILES ]
then 
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIME_STAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14) | zip "ZIP_FILE" -@

    if [ -f $ZIP_FILE ]
    then
        echo "Succesfully zipped files older than $DAYS"
       while IFS= read -r file #IFS , internal field separator,empty will ignore ,-r means not to ignore special characters like /
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

