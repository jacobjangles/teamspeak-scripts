#!/bin/bash

## TeamSpeak Setup ##
## Configure Service ##
read -p "Requires root (Enter) - (^C to abort)"

# Load variables
source config.sh

# Show set variables
printf "-- Set Variables --\n"
printf "${outmagenta}Installation directory:${outdefault} $installdir\n"
printf "${outmagenta}Installation user:${outdefault} $installuser\n"
printf "${outmagenta}Installation group:${outdefault} $installgroup\n"

printf "Creating TeamSpeak Unit file...\n"
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

printf "Setting permissions...\n"
chmod 644 /etc/systemd/system/teamspeak.service

printf "Enabling service...\n"
systemctl daemon-reload
systemctl enable teamspeak.service

printf "${outred}systemctl start teamspeak.service${outdefault} to start the service\n"
printf "${outgreen}Done.\n${outdefault}"
