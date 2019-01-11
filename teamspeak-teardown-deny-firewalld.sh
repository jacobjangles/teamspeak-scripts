#!/bin/bash

## TeamSpeak Teardown ##
## Deny FirewallD ##
read -p "Requires root (Enter) - (^C to abort)"

# Set output colours
outdefault="\033[0m"
outmagenta="\033[0;35m"
outgreen="\033[0;32m"
outred="\033[0;31m"

# Denying FirewallD ports
printf "${outmagenta}-- Denying ports with FirewallD --\n${outdefault}"
printf "${outmagenta}Denying 41144/tcp (IPv4 and IPv6)...\n${outdefault}";
firewall-cmd --zone=public --remove-port=41144/tcp;
printf "${outmagenta}Denying 9987/udp (IPv4 and IPv6)...\n${outdefault}"
firewall-cmd --zone=public --remove-port=9987/udp
printf "${outmagenta}Denying 30033/tcp (IPv4 and IPv6)...\n${outdefault}"
firewall-cmd --zone=public --remove-port=30033/tcp
printf "${outmagenta}Denying 10011/tcp (IPv4 and IPv6)...\n${outdefault}"
firewall-cmd --zone=public --remove-port=10011/tcp

printf "${outred}FirewallD is now denying on the listed ports.\n${outdefault}"
printf "${outmagenta}Done.\n${outdefault}"
