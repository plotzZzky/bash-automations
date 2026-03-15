#!/bin/bash


# - - - - - - - - Users - - - - - - - -
function generic_create_new_user() {
  local group=$1
  local user=$2
  local home_path=$3
  local pwd=$4

  # Criar um novo usuario
  useradd $user -m -d $home_path -G $group -p $(openssl passwd -1 "$pwd")
}


function create_new_user() {
  local group=$1
  local user=$2
  local home_path="/home/$group/$user"
  local pwd=$3

  echo "Criando usuario $user..."

  # Criar um novo usuario
  generic_create_new_user $group $user $home_path $pwd

  # Crias as permissões
  create_user_permissions $group $user $home_path

  echo "Feito!"
}


function create_user_permissions() {
  local group=$1
  local user=$2
  local home_path=$3

  # Permite que o usuario possa ver as pastas do grupo
  sudo chown "$user":"$group" "$home_path"
}


# - - - - - - - - Managers - - - - - - - -
function create_new_manager() {
  local group=$1
  local user=$2
  local home_path="/home/$group/$user"
  local pwd=$3

  echo "Criando gerente $user..."

  # Cria um novo chefe de grupo
  generic_create_new_user $group $user $home_path $pwd

  # Cria as permissões
  create_manager_permissions $user $home_path

  echo "Feito!"
}


function create_manager_permissions() {
  local user=$1
  local home_path=$2

  # Permite que apenas o manager tenha permissão de leitura, escrita e execução da sua pasta
  sudo chown -R "$user":"$user" "$home_path"
}


# - - - - - - - - Groups - - - - - - - -
function create_new_group() {
  local group_name=$1

  echo "Criando grupo $group_name..."

  # Criar um novo grupo
  groupadd $group_name

  echo "Feito!"
}


# - - - - - - - - Users and Groups - - - - - - - -
function create_new_group_and_users() {
  local group=$1
  local manager=$2
  local users=$3

  # Cria o grupo do setor
  create_new_group $group

  # Cria o novo gerente
  create_new_manager $group $manager $user

  # Para cada usuario na lista cria o usuario e adiciona ao grupo
  for user in $users; do
    create_new_user $group $user $user
  done
}


# - - - - - - - - Delete - - - - - - - -

function _delete_group() {
  local group=$1

  echo "Deletando $group"

  # Deleta um grupo criado para testes
  sudo groupdel -f "$1"

  echo "Feito!"
}


function _delete_user() {
  local user=$1

  echo "Deletando $user"

  # Deleta um usuario criado para testes
  sudo userdel -r -f "$user"

  echo "Feito!"
}


function _delete_group_and_users() {
  local group=$1
  local users=$2

  _delete_group $group

  # Deleta todos os usuarios da lista
  for user in $users; do
    _delete_user $user
  done
}


# - - - - - - - - Run - - - - - - - -

# Deleta os usuarios de tests
_delete_group_and_users "Test" "zeka ana maria pedro"

# Cria grupo, gerente e funcionarios do setor 
create_new_group_and_users "Test" "zeka" "ana maria pedro"

