#!/bin/bash

## TeamSpeak Setup ##
## Configure FirewallD ##
read -p "Requires root (Enter) - (^C to abort)"

# Load variables
source config.sh

printf "- Configuring FirewallD --\n"
echo "Do you use TSDNS? (If you're not sure, say no)"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) printf "Allowing 41144/tcp...\n";
      firewall-cmd --zone=public --add-port=41144/tcp --permanent;
      break;;
    No ) echo "Skipping TSDNS"
      break;;
    esac
done
printf "Allowing 9987/udp...\n"
firewall-cmd --zone=public --add-port=9987/udp --permanent
printf "Allowing 30033/tcp...\n"
firewall-cmd --zone=public --add-port=30033/tcp --permanent
printf "Allowing 10011/tcp...\n"
firewall-cmd --zone=public --add-port=10011/tcp --permanent
printf "${outgreen}Done.\n${outdefault}"
printf "${outmagenta}Here's the current FirewallD config:\n${outdefault}"
firewall-cmd --list-all