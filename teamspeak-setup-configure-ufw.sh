#!/bin/bash

## TeamSpeak Setup ##
## Configure UFW ##
read -p "Requires root (Enter) - (^C to abort)"

# Load variables
source config.sh

printf "- Configuring UFW --\n"
echo "Do you use TSDNS? (If you're not sure, say no)"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) printf "Allowing 41144/tcp (IPv4 and IPv6)...\n";
      ufw allow 41144/tcp;
      break;;
    No ) echo "Skipping TSDNS"
      break;;
    esac
done
printf "Allowing 9987/udp (IPv4 and IPv6)...\n"
ufw allow 9987/udp
printf "Allowing 30033/tcp (IPv4 and IPv6)...\n"
ufw allow 30033/tcp
printf "Allowing 10011/tcp (IPv4 and IPv6)...\n"
ufw allow 10011/tcp
printf "${outgreen}Done.\n${outdefault}"
printf "${outmagenta}Here's the current UFW config:\n${outdefault}"
ufw status
