#!/bin/bash
echo "      CONFIG'S IN FOLDER       "
echo "-------------------------------"
ls /etc/wireguard/clients
echo "-------------------------------"
echo -e "\n"
read -p "Enter wg config name:" wgconfig
echo "WARRING: MANY macOS PASSWORD ENTRIES, DON'T PANIC!"

vpnip=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}') 

while true; do
    read -p "macOS use WireGuard at this moment? [y/n]" yn
    case $yn in
        [Yy]* ) scp -P 25 /etc/wireguard/clients/$wgconfig administrator@$vpnip:~ ; echo "Enter macOS password" ; ssh -t administrator@$macip "sudo -s mkdir -p /usr/local/etc/wireguard && cd ~ && sudo mv ~/$wgconfig /usr/local/etc/wireguard/wg0.conf" ; read -n 1 -r -s -p $'Done, press Enter\n' ; bash ~/manage.sh ; break;;
        [Nn]* ) read -p "Enter macOS IP:" macip ; echo -e "\n"; echo "Enter macOS password" ;  scp /etc/wireguard/clients/$wgconfig administrator@$macip:~ ; echo -e "\n"; echo "Enter macOS password's only again" ; ssh -t administrator@$macip "sudo -s mkdir -p /usr/local/etc/wireguard && cd ~ && sudo mv ~/$wgconfig /usr/local/etc/wireguard/$wgconfig" ; read -n 1 -r -s -p $'Done, press Enter\n' ; bash ~/manage.sh; exit;;
        * ) echo "Please answer yes or no.";;
    esac

done
