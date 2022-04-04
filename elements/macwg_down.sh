#!/bin/bash
echo "-------------------------------"
ls /etc/wireguard/clients
echo "-------------------------------"
echo -e "\n"
read -p "Enter wg config name for up without ".conf":" wgconfig
echo -e "\n" 
read -p "Enter macOS IP:" macip
echo -e "\n" 
echo "Enter macOS password"
ssh -t administrator@$macip "sudo /usr/local/opt/wireguard-tools/bin/wg-quick down $wgconfig"
read -n 1 -r -s -p $'Done, press Enter\n'
bash ~/manage.sh
