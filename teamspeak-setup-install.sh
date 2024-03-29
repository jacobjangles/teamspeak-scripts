#!/bin/bash

## TeamSpeak Setup ##
## Install ##

# Load variables
source config.sh

# Show set variables
printf "-- Set Variables --\n"
printf "${outmagenta}TeamSpeak version:${outdefault} $teamspeakversion\n"
printf "${outmagenta}Installation directory:${outdefault} $installdir\n"
printf "${outmagenta}Backup directory:${outdefault} $backupdir\n"
printf "${outmagenta}Installation user:${outdefault} $installuser\n"
printf "${outmagenta}Installation group:${outdefault} $installgroup\n"

read -p "Execute (Enter) - (^C to abort)"

# Get and extract TeamSpeak
printf "\n"
printf "Downloading TeamSpeak...\n"
wget -P $installdir/ "https://files.teamspeak-services.com/releases/server/$teamspeakversion/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2"
printf "Extracting...\n"
mkdir $installdir/teamspeak-server-current
mkdir $backupdir
tar xf $installdir/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2 -C $installdir/teamspeak-server-current --strip-components 1

# Accept TeamSpeak license
printf "Accepting license...\n"
touch $installdir/teamspeak-server-current/.ts3server_license_accepted
echo "license_accepted=1" > $installdir/teamspeak-server-current/.ts3server_license_accepted

# Setting permissions
printf "Setting permissions...\n"
chown -R $installuser:$installgroup $installdir/*

# Cleaning up
printf "Cleaning up...\n"
rm $installdir/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2

printf "${outgreen}Done.\n${outdefault}"
