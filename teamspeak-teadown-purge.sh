#!/bin/bash

## TeamSpeak Teardown ##
## Purge ##
read -p "Requires root (Enter) - (^C to abort)"

# Set variables
installdir="/home/teamspeak"

# Set output colours
outdefault="\033[0m"
outmagenta="\033[0;35m"
outgreen="\033[0;32m"
outred="\033[0;31m"

# Show set variables
printf "${outmagenta}-- Set Variables --\n${outdefault}"
printf "${outgreen}Installation directory:${outdefault} $installdir\n"

# Remove TeamSpeak Service
printf "${outmagenta}Stopping service...\n${outdefault}"
systemctl stop teamspeak.service
printf "${outmagenta}Disabling service...\n${outdefault}"
systemctl disable teamspeak.service
systemctl daemon-reload
printf "${outmagenta}Removing Unit file...\n${outdefault}"
rm /etc/systemd/system/teamspeak.service

# Remove TeamSpeak installation files
printf "${outmagenta}Removing existing installation...\n${outdefault}"
rm -R $installdir/teamspeak-server-current/

printf "${outred}Your firewall ports are still open, but your teamspeak files are gone. You should tidy up your firewall.\n${outdefault}"
printf "${outmagenta}Done.\n${outdefault}"
