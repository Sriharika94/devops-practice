#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR Exists"
else
    echo "$SOURCE_DIR doesnt exists"
    exit 1
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "Files: $FILES"

while IFS= read -r file #IFS , internal field separator,empty will ignore ,-r means not to ignore special characters like /
do
    echo "deleting file: $file"
    rm -rf $file
done <<< $FILES

