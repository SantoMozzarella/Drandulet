#!/bin/bash
vpnip=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}') 
while true; do
    read -p "macOS use WireGuard at this moment? [y/n]" yn
    case $yn in
        [Yy]* ) ssh -t administrator@$vpnip -p 25 "sudo -s shutdown -r now"  ; break;;
        [Nn]* ) read -p "Enter macOS IP:" macip; echo -e "\n"; echo "Enter macOS password"; ssh -t administrator@$macip "sudo -s shutdown -r now"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
bash ~/manage.sh
