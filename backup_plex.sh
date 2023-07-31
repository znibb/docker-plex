#!/bin/bash

LOCAL_PATH=/home/znibb/docker/plex
BACKUP_PATH=/mnt/backup

# Check if running as root
if [[ $(id -u) -ne 0 ]]; then
  echo "Must be run as root"
  exit 1
fi

# Check that target path exists, attempt to mount if not present
if [[ ! $(findmnt -M $BACKUP_PATH) ]]; then
  mount $BACKUP_PATH &> /dev/null
  if [[ $? -ne 0 ]]; then
    echo "Unknown target path: $BACKUP_PATH"
    exit 2
  fi
fi

# Goto directory
cd $LOCAL_PATH

# Compress and store directory contents
tar -cz -f $BACKUP_PATH/plex.tar.gz -C $LOCAL_PATH .

# Exit gracefully
exit 0
