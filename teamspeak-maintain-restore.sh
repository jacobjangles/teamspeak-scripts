#!/bin/bash

## TeamSpeak Maintain ##
## Restore Backup ##
installdir="/home/teamspeak"
backupdir="/home/teamspeak/backups/teamspeak-backup-2019-01-13"
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

# Restore files from a backup and set the user and group
printf "\n"
printf "${outmagenta}Restoring and chowning the whitelist...\n${outdefault}"
cp $backupdir/query_ip_whitelist.txt $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/query_ip_whitelist.txt
printf "${outmagenta}Restoring and chowning the blacklist...\n${outdefault}"
cp $backupdir/query_ip_blacklist.txt $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/query_ip_blacklist.txt
printf "${outmagenta}Restoring and chowning the database...\n${outdefault}"
cp $backupdir/ts3server.sqlitedb $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/ts3server.sqlitedb
printf "${outmagenta}Restoring and chowning any files...\n${outdefault}"
cp -R $backupdir/files /$installdir/teamspeak-server-current/
chown -R $installuser:$installgroup /home/teamspeak/teamspeak-server-current/files
printf "${outmagenta}Restoring and chowning any .ini files... (You might not have any, that's ok)\n${outdefault}"
cp $backupdir/*.ini $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/*.ini
printf "${outmagenta}Restoring and chowning the license key... (You might not have one, that's ok)\n${outdefault}"
cp $backupdir/licensekey.dat $installdir/teamspeak-server-current/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/licensekey.dat
printf "${outmagenta}Restoring and chowning the tsdns .ini file... (You might not have one, that's ok)\n${outdefault}"
cp $backupdir/tsdns/tsdns_settings.ini $installdir/teamspeak-server-current/tsdns/
chown $installuser:$installgroup /home/teamspeak/teamspeak-server-current/tsdns/tsdns_settings.ini
printf "${outmagenta}Done.\n${outdefault}"

