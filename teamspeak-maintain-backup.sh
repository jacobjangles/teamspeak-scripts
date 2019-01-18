#!/bin/bash

## TeamSpeak Maintain ##
## Create Backup ##
read -p "Requires root (Enter) - (^C to abort)"
read -p "This will disrupt TeamSpeak (Enter) - (^C to abort)"

# Set Variables
installdir="/home/teamspeak"
backupdir="/home/teamspeak/backups"
installuser="teamspeak"
installgroup="teamspeak"

# Set output colours
outdefault="\033[0m"
outmagenta="\033[0;35m"
outgreen="\033[0;32m"

# Show set variables
printf "${outmagenta}-- Set Variables --\n${outdefault}"
printf "${outgreen}Installation directory:${outdefault} $installdir\n"
printf "${outgreen}Backup directory:${outdefault} $backupdir\n"
printf "${outgreen}Installation user:${outdefault} $installuser\n"
printf "${outgreen}Installation group:${outdefault} $installgroup\n"

# Take a clean backup of the teamspeak directory
systemctl teamspeak stop
sleep 1
cp -a $installdir/teamspeak-server-current "$backupdir/teamspeak-backup-$(date +"%Y-%m-%d")"
systemctl teamspeak start

printf "${outmagenta}Done.\n${outdefault}"