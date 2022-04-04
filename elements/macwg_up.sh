#!/bin/bash
echo -e "\n"
read -p "Enter wg config name for up without ".CONF":" wgconfig
echo -e "\n" 
read -p "Enter macOS IP:" macip
echo -e "\n" 
echo "Enter macOS password"
ssh -t administrator@$macip "sudo /usr/local/opt/wireguard-tools/bin/wg-quick up $wgconfig"
read -n 1 -r -s -p $'Done, press Enter\n'
bash ~/start.sh
