#!/bin/bash

if (( $EUID != 0 )); then
    echo -e "${CYAN}Rode esse script usando root"
    exit
fi

clear

instalaraddon(){
    echo -e "${CYAN}Instalando temas..."
    cd /var/www/pterodactyl
    rm -r pterodactylregisteraddonauto
    git clone https://github.com/CatValentine-Dev/pterodactylregisteraddonauto.git
    cd pterodactylregisteraddonauto
    rm -rf /var/www/pterodactyl/app/Providers/RouteServiceProvider.php
    rm -rf /var/www/pterodactyl/app/Http/Controllers/Auth/RegisterController.php
    rm -rf /var/www/resources/scripts/components/auth/LoginContainer.tsx
    rm -rf /var/www/pterodactyl/resources/views/templates/auth/register.blade.php
    rm -rf /var/www/pterodactyl/routes/register_module.php
    mv RouteServiceProvider.php /var/www/pterodactyl/app/Providers/
    mv RegisterController.php /var/www/pterodactyl/app/Http/Controllers/Auth/
    mv LoginContainer.tsx /var/www/pterodactyl/app/Http/Controllers/Auth/
    mv register.blade.php /var/www/pterodactyl/resources/views/templates/auth/
    mv register_module.php /var/www/pterodactyl/routes/
    rm -rf /var/www/pterodactyl/public/modules
    mkdir /var/www/pterodactyl/public/modules
    rm -rf /var/www/pterodactyl/public/modules/register.css
    mv register.css /var/www/pterodactyl/public/modules/
    cd /var/www/pterodactyl

    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    apt update
    apt install -y nodejs

    npm i -g yarn
    yarn

    cd /var/www/pterodactyl
    yarn build:production
    sudo php artisan optimize:clear
    chown -R www-data:www-data /var/www/pterodactyl/*


}

instaladordetemas(){
    while true; do
        read -p "Tem certeza de que deseja instalar o tema [y/n]? " yn
        case $yn in
            [Yy]* ) instalaraddon; break;;
            [Nn]* ) exit;;
            * ) echo "Por favor responda yes ou no.";;
        esac
    done
}

    CYAN='\033[0;36m'
    echo -e "${CYAN}Copyright (c) 2022 TemuxOS"
    echo -e "${CYAN}Esse progama e um software livre, você pode modificar e distribuir sem problemas"
    echo -e "${CYAN}Implementação Registro no Pterodactyl"
    echo -e "${CYAN}Discord: https://discord.gg/WkVVtTaBRh/"
    echo -e ""
    echo -e "${CYAN}[1] Instalar o Addon Register"
    echo -e "${CYAN}[2] Sair"
read -p "Insira um numero: " choice
if [ $choice == "1" ]
    then
    instaladordetemas
fi
if [ $choice == "2" ]
    then
    exit
fi
