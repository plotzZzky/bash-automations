#!/bin/bash

set -a
source .env
set +a


# --------------------------------- .env ----------------------------------
# Exemplo de variaveis do .env
#BASE="git"
#INTERNET="brave-bin transmission-gtk"
#DEV="code pycharm-community-edition nodejs npm docker"
#SECURITY=""
#ART=""
#OFFICE="libreoffice-still evince"
#EXTRA="papirus-icon-theme"
#AUR="arc-gtk-theme"


# --------------------------------- Functions ----------------------------------
function update_system() {
    sudo pacman -Syu --noconfirm
}

function install_packages() {
    echo -e "Instalando ${1}\n"
    
    sudo pacman -S $1 --noconfirm
    
    echo -e "Feito\n"
}

function install_aur_packages() {
    # Devido a natureza do aur não foi incluido o --noconfirm
    echo "Instalando os apps do AUR"
    yay -Syu $aur_apps
    echo "Feito"
}

function update_and_install_all() {
    update_system
    install_packages $BASE
    install_packages $INTERNET
    install_packages $DEV
    install_packages $SECURITY
    install_packages $ART
    install_packages $OFFICE
    install_packages $EXTRA
    install_aur_packages
}

# --------------------------------- Run ----------------------------------
update_and_install_all

