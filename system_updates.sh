#!/bin/bash
# define var
LOG_FILE="/var/log/system_update.log"

echo "Starting system update at $(date)" >> "$LOG_FILE"

# Update package list and upgrade all packages
sudo apt update && sudo apt upgrade -y >> "$LOG_FILE" 2>&1

#echo the message of finished the script & task
echo "System update completed at $(date)" >> "$LOG_FILE"

#echo line for adding end of task in case u run it again or make it in daily bases with crontab so u have to find breakdowns
echo "---------------------------------------------------" >> "$LOG_FILE"
