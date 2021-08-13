#!/bin/bash

## TeamSpeak Configuration ##
## Variables ##

# TeamSpeak installation directory
installdir="/home/teamspeak"
# User which will own TeamSpeak directory and files
installuser="teamspeak"
# Group which will own TeamSpeak directory and files
installgroup="teamspeak"
# Target TeamSpeak version
teamspeakversion="3.13.6"
# Backup directory
backupdir=$installdir"/backups"
# Restoration target directory
restoretarget=$backupdir"/teamspeak-backup-2021-08-13"

## Output Colours ##
# Default terminal colour
outdefault="\033[0m"
# Variables
outmagenta="\033[0;35m"
# Success
outgreen="\033[0;32m"
# Take note
outred="\033[0;31m"
