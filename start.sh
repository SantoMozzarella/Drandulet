#!/bin/bash

apt update -qq && apt install -qq dialog -y 

HEIGHT=15
WIDTH=50
CHOICE_HEIGHT=4
BACKTITLE="420 Network Solutions"
MENU="Choose one of the following options:"

OPTIONS=(1 "Configurate/Manage WireGuard "
         2 "Port Forwarding"
         3 "Send WireGuard config to macOS"
	 4 "Reboot VPN Server"
	 5 "Reboot macOS"
	 6 "Start Wireguard on macOS"
 	 7 "Stop Wireguard on macOS")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            curl -s https://raw.githubusercontent.com/SantoMozzarella/Drandulet/main/wireguard_manager.sh --create-dirs -o ~/drandulet/wireguard_manager.sh && chmod +x ~/drandulet/wireguard_manager.sh && bash ~/drandulet/wireguard_manager.sh
            ;;
        2)
            curl -s https://raw.githubusercontent.com/SantoMozzarella/Drandulet/main/pf.sh --create-dirs -o ~/drandulet/pf.sh && chmod +x ~/drandulet/pf.sh && bash ~/drandulet/pf.sh
            ;;
        
    	3)  curl -s https://raw.githubusercontent.com/SantoMozzarella/Drandulet/main/send_wg.sh --create-dirs -o ~/drandulet/send_wg.sh && chmod +x ~/drandulet/send_wg.sh && bash ~/drandulet/send_wg.sh
            ;;
	
	    4)  reboot
	        ;;
    	
    	5)  curl -s https://raw.githubusercontent.com/SantoMozzarella/Drandulet/main/reset_mac.sh --create-dirs -o ~/drandulet/reset_mac.sh && chmod +x ~/drandulet/reset_mac.sh && bash ~/drandulet/reset_mac.sh
	    ;;
	
	    6)  curl -s https://raw.githubusercontent.com/SantoMozzarella/Drandulet/main/macwg_up.sh --create-dirs -o ~/drandulet/macwg_up.sh && chmod +x ~/drandulet/macwg_up.sh && bash ~/drandulet/macwg_up.sh
	    ;;
        
	    7)  curl -s https://raw.githubusercontent.com/SantoMozzarella/Drandulet/main/macwg_down.sh --create-dirs -o ~/drandulet/macwg_down.sh && chmod +x ~/drandulet/macwg_down.sh && bash ~/drandulet/macwg_down.sh	    
	    ;;
esac
