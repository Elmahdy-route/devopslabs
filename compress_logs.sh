#!/bin/bash

LOG_DIR="/var/log"
BACKUP_DIR="/var/log/old_logs"
DAYS=7

# Ensure gzip is installed & install it if not found 
if ! command -v gzip &> /dev/null; then
    echo "gzip not found. Installing it now..."
    sudo apt update && sudo apt install -y gzip
fi

# Ensure backup directory exists & create it 
mkdir -p "$BACKUP_DIR"

# Find logs older than 7 days, compress them, and move to backup directory
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec gzip {} \; -exec mv {}.gz "$BACKUP_DIR" \;

#echo the message of finished the script & task
echo "Log files older than $DAYS days compressed and moved to $BACKUP_DIR."

#echo line for adding end of task in case u run it again or make it in daily bases with crontab so u have to find breakdowns
echo "---------------------------------------------------" >> "$LOG_FILE"