#!/bin/bash

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

echo "Configurando nova a sshkey para github..."

user_email=""
username=""

# Recebe os username e email
read -r -p "Digite o seu e-mail: " user_email
read -r -p "Digite o nome do seu usuário: " username

# Cria a nova chave ssh
ssh-keygen -t ed25519 -C $user_email -f "$HOME/.ssh/github_key"

# Adiciona a nova chave ao chaveiro
ssh-add ~/.ssh/github_key

# Configura o user do git
git --global user.username $username
git --global user.email $email

# Exibe a chave para ser colada na config do github
echo -e "Cole a linha abaixo na config do github\n"

cat ~/.ssh/github_key.pub

echo ""

# Abre o navegador na pagina do github
xdg-open https://github.com/

