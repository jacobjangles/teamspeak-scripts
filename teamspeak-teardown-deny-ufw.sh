#!/bin/bash

## TeamSpeak Teardown ##
## Deny UFW ##
read -p "Requires root (Enter) - (^C to abort)"

# Load variables
source config.sh

# Denying UFW ports
printf "-- Denying ports with UFW --\n"
printf "Denying 41144/tcp (IPv4 and IPv6)...\n";
ufw deny 41144/tcp;
printf "Denying 9987/udp (IPv4 and IPv6)...\n"
ufw deny 9987/udp
printf "Denying 30033/tcp (IPv4 and IPv6)...\n"
ufw deny 30033/tcp
printf "Denying 10011/tcp (IPv4 and IPv6)...\n"
ufw deny 10011/tcp

printf "${outred}UFW is now denying on the listed ports. You can manually remove these entries by using 'ufw status numbered', and 'ufw delete \$number' on the desired rule.\n${outdefault}"
printf "${outgreen}Done.\n${outdefault}"
printf "${outmagenta}Here's the current UFW config:\n${outdefault}"
ufw status
