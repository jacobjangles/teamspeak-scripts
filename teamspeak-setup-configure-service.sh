#!/bin/bash

## TeamSpeak Setup ##
## Configure Service ##
read -p "Requires root (Enter) - (^C to abort)"

# Set variables
installdir="/home/teamspeak"
installuser="teamspeak"
installgroup="teamspeak"

# Set output colours
outdefault="\033[0m"
outmagenta="\033[0;35m"
outgreen="\033[0;32m"

# Show set variables
printf "${outmagenta}-- Set Variables --\n${outdefault}"
printf "${outgreen}Installation directory:${outdefault} $installdir\n"
printf "${outgreen}Installation user:${outdefault} $installuser\n"
printf "${outgreen}Installation group:${outdefault} $installgroup\n"

printf "${outmagenta}Creating TeamSpeak Unit file...\n${outdefault}"
cat >/etc/systemd/system/teamspeak.service <<EOL
[Unit]
Description=TeamSpeak3 Server Daemon
After=network.service

[Service]
User=$installuser
Group=$installgroup
Type=forking
WorkingDirectory=$installdir/teamspeak-server-current/
ExecStart=$installdir/teamspeak-server-current/ts3server_startscript.sh start
ExecStop=$installdir/teamspeak-server-current/ts3server_startscript.sh stop
PIDFile=/$installdir/teamspeak-server-current/ts3server.pid
RestartSec=15
Restart=always

[Install]
WantedBy=multi-user.target
EOL

printf "${outmagenta}Setting permissions...\n${outdefault}"
chmod 644 /etc/systemd/system/teamspeak.service

printf "${outmagenta}Enabling service...\n${outdefault}"
systemctl daemon-reload
systemctl enable teamspeak.service

printf "${outgreen}systemctl start teamspeak.service${outdefault} to start the service\n"
printf "${outmagenta}Done.\n${outdefault}"
