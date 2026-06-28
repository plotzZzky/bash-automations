# Script para fazer a instalação e configuração do virt-manager no arch linux
#!/bin/bash

# Lista dos packages necessários
PACKAGE_MANAGER_CMD="pacman --noconfirm -Syu"
PACKAGES="virt-manager qemu-desktop libvirt virt-viewer edk2-ovmf dnsmasq openbsd-netcat iptables-nft libguestfs"

# - - - - - - - Code - - - - - - -
function start_instalation() {
  echo -e "Instalando o virt-manager\n"
  
  install_packages
  
  enable_virtd
  
  add_user_to_libvirt_group
  
  set_rede_default
  
  echo -e "Feito!\n"
  
}

function install_packages() {
  # Instala os pacotes necessarios
  sudo $PACKAGE_MANAGER_CMD $PACKAGES
}

function enable_virtd() {
  # Inicia o libvirtd service
  sudo systemctl enable --now libvirtd.service
  sudo systemctl enable --now libvirtd.socket
}

function add_user_to_libvirt_group() {
  # Adiciona o usuario atual ao grupo do libvirt
  sudo usermod -aG libvirt,kvm $USER
}

function set_rede_default() {
  # Configura a rede default
  sudo virsh net-start default
  sudo virsh net-autostart default
}

# - - - - - - - Run - - - - - - -
# Executa esse script
start_instalation

