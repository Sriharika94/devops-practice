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