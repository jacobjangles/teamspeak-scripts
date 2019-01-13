#!/bin/bash

## TeamSpeak Teardown ##
## Deny UFW ##
read -p "Requires root (Enter) - (^C to abort)"

# Set output colours
outdefault="\033[0m"
outmagenta="\033[0;35m"
outgreen="\033[0;32m"
outred="\033[0;31m"

# Denying UFW ports
printf "${outmagenta}-- Denying ports with UFW --\n${outdefault}"
printf "${outmagenta}Denying 41144/tcp (IPv4 and IPv6)...\n${outdefault}";
ufw deny 41144/tcp;
printf "${outmagenta}Denying 9987/udp (IPv4 and IPv6)...\n${outdefault}"
ufw deny 9987/udp
printf "${outmagenta}Denying 30033/tcp (IPv4 and IPv6)...\n${outdefault}"
ufw deny 30033/tcp
printf "${outmagenta}Denying 10011/tcp (IPv4 and IPv6)...\n${outdefault}"
ufw deny 10011/tcp

printf "${outred}UFW is now denying on the listed ports. You can manually remove these entries by using 'ufw status numbered', and 'ufw delete \$number' on the desired rule.\n${outdefault}"
printf "${outmagenta}Done.\n${outdefault}"
printf "${outmagenta}Here's the current UFW config:\n${outdefault}"
ufw status
