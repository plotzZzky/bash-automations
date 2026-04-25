#!/bin/bash

# ----------------------- Install ----------------------
echo -e "Instalando pacotes...\n"

# Instala os pacotes necessários
bash install_packages_arch_linux.sh

# Instala e configura o virt-manager
bash install_virt_manager.sh

# ----------------------- Links ----------------------
echo -e "Criando links...\n"

# Cria os links para as pastas em outra partição
bash create_links_folders.sh

# ----------------------- Certificados ----------------------
echo -e "Criando o certificado ssh...\n"

# Cria as chaves para o git
bash create_github_ssh_key.sh

echo -e "Feito!\n"

