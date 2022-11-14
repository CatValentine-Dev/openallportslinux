#!/bin/bash

if (( $EUID != 0 )); then
    echo -e "${CYAN}Rode esse script usando root"
    exit
fi

clear



portuguese(){
    bash <(curl https://raw.githubusercontent.com/CatValentine-Dev/openallportslinux/main/openallportsbrasilian.sh)
}

german(){
    bash <(curl https://raw.githubusercontent.com/CatValentine-Dev/openallportslinux/main/openallportsgerman.sh)
    echo -e "${CYAN}Sprache ändern...."
}

english(){
    bash <(curl https://raw.githubusercontent.com/CatValentine-Dev/openallportslinux/main/openallportsenglish.sh)
    echo -e "${CYAN}Changing to english...."
}

    CYAN='\033[0;36m'
    echo -e "${CYAN}Copyright (c) 2022 TemuxOS"
    echo -e "${CYAN}Esse progama e um software livre, você pode modificar e distribuir sem problemas"
    echo -e ""
    echo -e "${CYAN}Discord: https://discord.gg/WkVVtTaBRh/"
    echo -e ""
    echo -e "${CYAN}[1] Portuguese"
    echo -e "${CYAN}[2] German"
    echo -e "${CYAN}[3] English"
    echo -e "${CYAN}[4] Exit"
    
read -p "Insira um numero: " choice
if [ $choice == "1" ]
    then
    portuguese
    echo -e "${CYAN}Mudando Linguagem...."
fi
if [ $choice == "2" ]
    then
    german
fi
if [ $choice == "3" ]
    then
    english
fi
if [ $choice == "4" ]
    then
    exit
fi
