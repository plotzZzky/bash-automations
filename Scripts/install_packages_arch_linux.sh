#!/bin/bash

# ------------------------ Importa as variaveis do .env -------------------------
set -a
source ../.env
set +a

# ------------------------ Listas com os apps para instalar -------------------------
# Essas lista estão no .env

# base=""
# dev="code pycharm-community-edition nodejs npm docker"
# security=""
# art="krita"
# apps="libreoffice-still evince"
# aur_apps="arc-gtk-theme"

# ----------------------------------- Functions ------------------------------------
function update_system() {
    sudo pacman -Syu --noconfirm
}

function install_packges() {
    echo "Instalando ${1}"
    sudo pacman -S $1 --noconfirm
    echo "Feito"
}

function install_aur_packges() {
    # Devido a natureza do aur não foi incluido o --noconfirm
    echo "Instalando os apps do AUR"
    yay -Syu $aur_apps
    echo "Feito"
}

function update_and_install_all() {
    update_system
    install_packges $base
    install_packges $dev
    install_packges $security
    install_packges $art
    install_packges $apps
    install_aur_packges
}

update_and_install_all
