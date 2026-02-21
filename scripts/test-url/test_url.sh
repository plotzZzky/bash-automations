#!/bin/bash


# -------------------- Nao permite a execução desse script diretamente ------------------------
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then 
    echo "Este script deve ser incluído (source) e não executado diretamente."
    exit 1
fi

# ------------------------------------ funções genericas --------------------------------------
function generic_request_url() {
	method=$1  # metodo http
	url=$2  # Url para a solicitação

	create_header_line # Cabeçalho

	echo "-> Testando "$method" em $url" # Mensagem de apresentação
	printf "Result: "
    curl -X "$method" -s "$url" # Faz a solicitação

    create_footer_line # rodape
}

create_header_line() { printf '%*s \n' 90 '' | tr ' ' "-";} # Cria um cabeçalho

create_footer_line() { printf '\n %*s \n' 89 '' | tr ' ' "-";} # Cria um rodape

# ------------------------------------ funções simples ----------------------------------------
function get() {
	# Faz uma solicitação GET na url
	generic_request_url "GET" $1
}

function post() {
	# Faz uma solicitação POST na url
	generic_request_url "POST" $1
}

function put() {
	# Faz uma solicitação POST na url
	generic_request_url "PUT" $1
}

function delete() {
	# Faz uma solicitação POST na url
	generic_request_url "DELETE" $1
}

