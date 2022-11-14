#!/bin/bash

if (( $EUID != 0 )); then
    echo -e "${CYAN}Rode esse script usando root"
    exit
fi

clear

openallports(){
    echo -e "${CYAN}Abrindo Portas no Firewall..."
    sudo iptables-save > ~/iptables-rules
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -F
}

openallports1(){
    while true; do
        read -p "Tem certeza que quer abrir as portas em sua maquina [y/n]? " yn
        case $yn in
            [Yy]* ) openallports; break;;
            [Nn]* ) exit;;
            * ) echo "Por favor responda yes ou no.";;
        esac
    done
}

    CYAN='\033[0;36m'
    echo -e "${CYAN}Copyright (c) 2022 TemuxOS"
    echo -e "${CYAN}Esse progama e um software livre, você pode modificar e distribuir sem problemas"
    echo -e "${CYAN}Abre todas as Portas do seu Firewall"
    echo -e "${CYAN}Discord: https://discord.gg/WkVVtTaBRh/"
    echo -e ""
    echo -e "${CYAN}[1] Abrir todas as portas"
    echo -e "${CYAN}[2] Sair"
read -p "Insira um numero: " choice
if [ $choice == "1" ]
    then
    openallports1
fi
if [ $choice == "2" ]
    then
    exit
fi
