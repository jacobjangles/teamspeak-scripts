#!/bin/bash

## TeamSpeak Teardown ##
## Purge ##
read -p "Requires root (Enter) - (^C to abort)"

# Load variables
source config.sh

# Show set variables
printf "-- Set Variables --\n"
printf "${outmagenta}Installation directory:${outdefault} $installdir\n"
printf "${outmagenta}Backup directory:${outdefault} $backupdir\n"

read -p "Execute (Enter) - (^C to abort)"

# Remove TeamSpeak Service
printf "Stopping service...\n"
systemctl stop teamspeak.service
printf "Disabling service...\n"
systemctl disable teamspeak.service
systemctl daemon-reload
printf "Removing Unit file...\n"
rm /etc/systemd/system/teamspeak.service

# Remove TeamSpeak installation files
printf "Removing existing installation...\n"
rm -Rf $installdir/teamspeak-server-current/
rm -Rf $backupdir/

printf "${outred}Your firewall ports are still open, but your teamspeak files are gone. You should tidy up your firewall.\n${outdefault}"
printf "${outgreen}Done.\n${outdefault}"
