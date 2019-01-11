#!/bin/bash

## TeamSpeak Setup ##
## Configure FirewallD ##
read -p "Requires root (Enter) - (^C to abort)"

# Set output colours
outdefault="\033[0m"
outmagenta="\033[0;35m"

printf "${outmagenta}- Configuring FirewallD --\n${outdefault}"
echo "Do you use TSDNS? (If you're not sure, say no)"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) printf "${outmagenta}Allowing 41144/tcp...\n${outdefault}";
      firewall-cmd --zone=public --add-port=41144/tcp;
      break;;
    No ) echo "Skipping TSDNS"
      break;;
    esac
done
printf "${outmagenta}Allowing 9987/udp...\n${outdefault}"
firewall-cmd --zone=public --add-port=9987/udp
printf "${outmagenta}Allowing 30033/tcp...\n${outdefault}"
firewall-cmd --zone=public --add-port=30033/tcp
printf "${outmagenta}Allowing 10011/tcp...\n${outdefault}"
firewall-cmd --zone=public --add-port=10011/tcp
printf "${outmagenta}Done.\n${outdefault}"