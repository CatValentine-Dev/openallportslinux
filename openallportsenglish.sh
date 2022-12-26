#!/bin/bash

if (( $EUID != 0 )); then
    echo -e "${CYAN}Run this script as root"
    exit
fi

clear

openallports(){
    echo -e "${CYAN}Opening ports in the firewall..."
    sudo iptables-save > ~/iptables-rules
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -F
    sudo netfilter-persistent save
}

openallports1(){
    while true; do
        read -p "Are you sure you want to open the ports on your computer? [y/n]? " yn
        case $yn in
            [Yy]* ) openallports; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

    CYAN='\033[0;36m'
    echo -e "${CYAN}Copyright (c) 2022 TemuxOS"
    echo -e "${CYAN}This program is free software, you can modify and distribute it without any problems."
    echo -e "${CYAN}Open all ports on your firewall"
    echo -e "${CYAN}Discord: https://discord.gg/WkVVtTaBRh/"
    echo -e ""
    echo -e "${CYAN}[1] open all ports"
    echo -e "${CYAN}[2] exit"
read -p "geben Sie eine Zahl ein: " choice
if [ $choice == "1" ]
    then
    openallports1
fi
if [ $choice == "2" ]
    then
    exit
fi
