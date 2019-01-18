#!/bin/bash

## TeamSpeak Setup ##
## Configure UFW ##
read -p "Requires root (Enter) - (^C to abort)"

# Set output colours
outdefault="\033[0m"
outmagenta="\033[0;35m"

printf "${outmagenta}- Configuring UFW --\n${outdefault}"
echo "Do you use TSDNS? (If you're not sure, say no)"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) printf "${outmagenta}Allowing 41144/tcp (IPv4 and IPv6)...\n${outdefault}";
      ufw allow 41144/tcp;
      break;;
    No ) echo "Skipping TSDNS"
      break;;
    esac
done
printf "${outmagenta}Allowing 9987/udp (IPv4 and IPv6)...\n${outdefault}"
ufw allow 9987/udp
printf "${outmagenta}Allowing 30033/tcp (IPv4 and IPv6)...\n${outdefault}"
ufw allow 30033/tcp
printf "${outmagenta}Allowing 10011/tcp (IPv4 and IPv6)...\n${outdefault}"
ufw allow 10011/tcp
printf "${outmagenta}Done.\n${outdefault}"
printf "${outmagenta}Here's the current UFW config:\n${outdefault}"
ufw status
