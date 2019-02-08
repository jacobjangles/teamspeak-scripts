#!/bin/bash

## TeamSpeak Teardown ##
## Deny FirewallD ##
read -p "Requires root (Enter) - (^C to abort)"

# Load variables
source config.sh

# Denying FirewallD ports
printf "-- Denying ports with FirewallD --\n"
printf "Denying 41144/tcp (IPv4 and IPv6)...\n";
firewall-cmd --zone=public --remove-port=41144/tcp --permanent;
printf "Denying 9987/udp (IPv4 and IPv6)...\n"
firewall-cmd --zone=public --remove-port=9987/udp --permanent
printf "Denying 30033/tcp (IPv4 and IPv6)...\n"
firewall-cmd --zone=public --remove-port=30033/tcp --permanent
printf "Denying 10011/tcp (IPv4 and IPv6)...\n"
firewall-cmd --zone=public --remove-port=10011/tcp --permanent

printf "${outred}FirewallD is now denying on the listed ports.\n${outdefault}"
printf "${outgreen}Done.\n${outdefault}"
printf "${outmagenta}Here's the current FirewallD config:\n${outdefault}"
firewall-cmd --list-all
