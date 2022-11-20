#!/bin/bash

if (( $EUID != 0 )); then
    echo -e "${CYAN}Bitte führen sie dieses Skript als Root aus!"
    exit
fi

clear

openallports(){
    echo -e "${CYAN}Öffne Ports in der Firewall..."
    sudo iptables-save > ~/iptables-rules
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -F
}

openallports1(){
    while true; do
        read -p "Sind Sie sicher, dass Sie die Ports öffnen möchten? [y/n]? " yn
        case $yn in
            [Yy]* ) openallports; break;;
            [Nn]* ) exit;;
            * ) echo "Bitte antworte mit Ja [y] oder Nein [n]";;
        esac
    done
}

    CYAN='\033[0;36m'
    echo -e "${CYAN}Copyright (c) 2022 TemuxOS"
    echo -e "${CYAN}Dieses Programm ist freie Software, Sie können es ohne Probleme modifizieren und verteilen."
    echo -e "${CYAN}Öffnen Sie alle Ports Ihrer Firewall"
    echo -e "${CYAN}Discord: https://discord.gg/WkVVtTaBRh/"
    echo -e ""
    echo -e "${CYAN}[1] Ports öffnen"
    echo -e "${CYAN}[2] Verlassen"
read -p "geben Sie eine Zahl ein: " choice
if [ $choice == "1" ]
    then
    openallports1
fi
if [ $choice == "2" ]
    then
    exit
fi
