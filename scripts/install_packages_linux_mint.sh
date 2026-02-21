#!/bin/bash

set -a
source .env
set +a

# Exemplo de variaveis do .env
# BASE="xfce4-goodies docker.io"
# DEV="nodejs npm"
# ART="krita shotcut"
# OFFICE="libreoffice evince"
# INTERNET="Brave VSCodium"


function update_and_upgrade_system() {
  sudo apt update -y && apt upgrade -y
}


function generic_install_packages() {
  local app_name=$1
  local tool=$2

  echo -e "Instalando $app_name \n"

  sudo $tool install -y $app_name # -y == --assume-yes

  echo -e "\nFeito\n"
}


function install_apt_packages() {
  local app_name=$1
  generic_install_packages "$app_name" "apt"
}


function install_flatpak_packages() {
  local app_name=$1
  generic_install_packages "$app_name" "flatpak"
}


function install_all_packages() {
  update_and_upgrade_system

  install_apt_packages "$BASE"
  install_apt_packages "$DEV"
  install_apt_packages "$ART"
  install_apt_packages "$OFFICE"

  install_flatpak_packages "$INTERNET"
}


install_all_packages

