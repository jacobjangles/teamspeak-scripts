#!/bin/bash

## TeamSpeak Maintain ##
## Create Backup ##
read -p "Requires root (Enter) - (^C to abort)"
read -p "This will disrupt TeamSpeak (Enter) - (^C to abort)"

# Load variables
source config.sh

# Show set variables
printf "-- Set Variables --\n"
printf "${outmagenta}Installation directory:${outdefault} $installdir\n"
printf "${outmagenta}Backup directory:${outdefault} $backupdir\n"
printf "${outmagenta}Installation user:${outdefault} $installuser\n"
printf "${outmagenta}Installation group:${outdefault} $installgroup\n"

# Take a clean backup of the teamspeak directory
systemctl stop teamspeak
sleep 1
cp -a $installdir/teamspeak-server-current "$backupdir/teamspeak-backup-$(date +"%Y-%m-%d")"
systemctl start teamspeak

printf "${outgreen}Done.\n${outdefault}"