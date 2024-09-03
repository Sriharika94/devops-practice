#!/bin/bash

# Set the threshold percentage
THRESHOLD=5

# Get the current disk usage percentage
disk_usage=$(df  | grep boot | awk '{ print $5 }' | sed 's/%//')

# Check if disk usage exceeds the threshold
if [ $disk_usage -gt $THRESHOLD ]
then
  echo "Warning: Disk usage has exceeded"
  
else
  echo "Disk usage is within safe limits."
  
fi
