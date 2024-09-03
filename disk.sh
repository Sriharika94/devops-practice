#!/bin/bash

# Set the threshold percentage
THRESHOLD=50

# Get the current disk usage percentage
disk_usage=$(df | grep xfs)

# Check if disk usage exceeds the threshold
if [ "$disk_usage" -gt "$THRESHOLD" ]; then
  echo "Warning: Disk usage has exceeded ${THRESHOLD}%."
  echo "Current disk usage: ${disk_usage}%"
else
  echo "Disk usage is within safe limits."
  echo "Current disk usage: ${disk_usage}%"
fi
