#!/bin/bash

# Esse script delete as pastas "inuteis" do projeto para facilitar backups locais

folder_path="."
folders="venv .venv .idea .next node_modules __pycahe__"


function find_and_delete_folders() {
	# Busca as pastas para deletar
	for folder in $folders; do
		result=$(find $folder_path -type d -name $folder)
		
		# Deleta as pastas selecionadas
		delete_folders $result
	done

}


function delete_folders() {
	# Deleta as pastas selecionadas
	local folders=$1

	for folder in $folders; do
		rm -r $folder
	done 
}

# - - - - - - - Run - - - - - - -

echo -e "Buscando pastas para deletar...\n"

find_and_delete_folders 

echo -e "Pastas deletadas."
