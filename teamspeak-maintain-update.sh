#!/bin/bash

## TeamSpeak Maintain ##
## Update ##
read -p "Requires root (Enter) - (^C to abort)"
read -p "This will disrupt TeamSpeak (Enter) - (^C to abort)"
read -p "Version changes might bork TeamSpeak (Enter) - (^C to abort)"
read -p "Take a backup (Enter) - (^C to abort)"
read -p "Seriously (Enter) - (^C to abort)"

# Load variables
source config.sh

# Show set variables
printf "-- Set Variables --\n"
printf "${outmagenta}TeamSpeak version:${outdefault} $teamspeakversion\n"
printf "${outmagenta}Installation directory:${outdefault} $installdir\n"
printf "${outmagenta}Installation user:${outdefault} $installuser\n"
printf "${outmagenta}Installation group:${outdefault} $installgroup\n"

read -p "Execute (Enter) - (^C to abort)"

# Get and extract TeamSpeak
printf "\n"
printf "Downloading TeamSpeak...\n"
wget -P $installdir/ "https://files.teamspeak-services.com/releases/server/$teamspeakversion/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2"
printf "Stopping TeamSpeak...\n"
systemctl stop teamspeak
sleep 1
printf "Extracting...\n"
tar xf $installdir/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2 -C $installdir/teamspeak-server-current --strip-components 1

# Setting permissions
printf "Setting permissions...\n"
chown -R $installuser:$installgroup $installdir/*

printf "Starting TeamSpeak...\n"
systemctl start teamspeak

# Cleaning up
printf "Cleaning up...\n"
rm $installdir/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2

printf "${outgreen}Done.\n${outdefault}"
