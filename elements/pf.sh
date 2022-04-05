#!/bin/bash

apt update -qq && apt upgrade -qq -y
apt install iptables -qq -y

echo -e "\n----------------------------------"
echo  "YOUR VPN SERVER IP:"
ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
echo -e "----------------------------------\n"

echo -e "\n"
echo -e "Step 1: Configurate port forwarding\n"
read -p "Enter macOS IP:" macip
read -p "Enter VPN server IP:" vpnip
iptables -F
iptables -t nat -I PREROUTING -p tcp -d $vpnip --dport 5900 -j DNAT --to-destination $macip:5900
iptables -t nat -I PREROUTING -p tcp -d $vpnip --dport 4000 -j DNAT --to-destination $macip:4000
iptables -t nat -I PREROUTING -p tcp -d $vpnip --dport 25 -j DNAT --to-destination $macip:22

echo -e "\n------------------------------------------"
echo -e "Your VNC to MAC: ${vpnip}:5900 \nYour NoMachine to MAC: ${vpnip}:4000  \nYour SSH to mac: ${vpnip}:25\n"
echo -e "Remember this dude, ok? \n"
echo -e "\n"
read -n 1 -r -s -p $'If yes - Press Enter to main menu\n'
bash ~/start.sh
