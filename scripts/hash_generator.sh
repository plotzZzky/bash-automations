#!/bin/bash

# ---------------------------- Basic functions ---------------------------
function generic_create_file_hash() {
	echo "Criando o hashfile do arquivo ${1}..."

	local algorithm=$1
	local filename=$2

	local clean_name=$(return_clean_name $filename)  # filename limpo
	local date=$(date +%s)
	local hash=$($algorithm $filename | awk '{print $1}') # hash sem o filename do final

cat <<EOF > "${algorithm}_${clean_name}_${date}.txt" # Cria o arquivo com a hash
filename=$filename
timestamp=$date
hash=$hash
EOF

	echo "Feito!"
}

function return_clean_name() {
	# Limpa o filename de chars especiais e retorna o nome
    local raw_name="$1"

    local name_no_ext="${raw_name%.*}" # remove a extensao do nome do arquivo

    local clean_name="$(echo "$name_no_ext" | tr -cd '[:alnum:]_')" # nome se chars especiais

	echo "$clean_name" # retorna o nome limpo
}

# ---------------------------- Useful functions ---------------------------
function create_file_hash_md5sum() {
	generic_create_file_hash md5sum $1
}

function create_file_hash_sha1sum() {
	generic_create_file_hash sha1sum $1
}

function create_file_hash_sha256sum() {
	generic_create_file_hash sha256sum $1
}

function create_file_hash_sha512sum() {
	generic_create_file_hash sha512sum $1
}
