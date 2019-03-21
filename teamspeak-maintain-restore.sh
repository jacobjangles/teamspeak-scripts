#!/bin/bash

## TeamSpeak Maintain ##
## Restore Backup ##

# Load variables
source config.sh

# Show set variables
printf "-- Set Variables --\n"
printf "${outmagenta}Installation directory:${outdefault} $installdir\n"
printf "${outmagenta}Backup directory:${outdefault} $backupdir\n"
printf "${outmagenta}Installation user:${outdefault} $installuser\n"
printf "${outmagenta}Installation group:${outdefault} $installgroup\n"

read -p "Execute (Enter) - (^C to abort)"

# Restore files from a backup and set the user and group
printf "\n"
printf "Restoring and chowning the whitelist...\n"
cp $backupdir/query_ip_whitelist.txt $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/query_ip_whitelist.txt
printf "Restoring and chowning the blacklist...\n"
cp $backupdir/query_ip_blacklist.txt $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/query_ip_blacklist.txt
printf "Restoring and chowning the database...\n"
cp $backupdir/ts3server.sqlitedb $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/ts3server.sqlitedb
printf "Restoring and chowning any files...\n"
cp -R $backupdir/files /$installdir/teamspeak-server-current/
chown -R $installuser:$installgroup /home/teamspeak/teamspeak-server-current/files
printf "Restoring and chowning any .ini files... (You might not have any, that's ok)\n"
cp $backupdir/*.ini $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/*.ini
printf "Restoring and chowning the license key... (You might not have one, that's ok)\n"
cp $backupdir/licensekey.dat $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/licensekey.dat
printf "Restoring and chowning the tsdns .ini file... (You might not have one, that's ok)\n"
cp $backupdir/tsdns/tsdns_settings.ini $installdir/teamspeak-server-current/tsdns/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/tsdns/tsdns_settings.ini
printf "${outgreen}Done.\n${outdefault}"
