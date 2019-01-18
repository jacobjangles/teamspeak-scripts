#!/bin/bash

## TeamSpeak Setup ##
## Install ##
teamspeakversion="3.5.1"
installdir="/home/teamspeak"
installuser="teamspeak"
installgroup="teamspeak"

# Set output colours
outdefault="\033[0m"
outmagenta="\033[0;35m"
outgreen="\033[0;32m"

# Show set variables
printf "${outmagenta}-- Set Variables --\n${outdefault}"
printf "${outgreen}TeamSpeak version:${outdefault} $teamspeakversion\n"
printf "${outgreen}Installation directory:${outdefault} $installdir\n"
printf "${outgreen}Installation user:${outdefault} $installuser\n"
printf "${outgreen}Installation group:${outdefault} $installgroup\n"

# Get and extract TeamSpeak
printf "\n"
printf "${outmagenta}Downloading TeamSpeak...\n${outdefault}"
wget -P $installdir/ "http://dl.4players.de/ts/releases/$teamspeakversion/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2"
printf "${outmagenta}Extracting...\n${outdefault}"
mkdir $installdir/teamspeak-server-current
tar xf $installdir/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2 -C $installdir/teamspeak-server-current --strip-components 1

# Accept TeamSpeak license
printf "${outmagenta}Accepting license...\n${outdefault}"
touch $installdir/teamspeak-server-current/.ts3server_license_accepted
echo "license_accepted=1" > $installdir/teamspeak-server-current/.ts3server_license_accepted

# Setting permissions
printf "${outmagenta}Setting permissions...\n${outdefault}"
chown -R $installuser:$installgroup $installdir/*

# Cleaning up
printf "${outmagenta}Cleaning up...\n${outdefault}"
rm $installdir/teamspeak3-server_linux_amd64-$teamspeakversion.tar.bz2

printf "${outmagenta}Done.\n${outdefault}"
