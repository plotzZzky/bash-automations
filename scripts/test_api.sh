#!/bin/bash

# ------------------------------------ funções genericas --------------------------------------
function generic_request_url() {
	local method=$1  # metodo http
	local url=$2  # Url para a solicitação

	create_header_line # Cabeçalho

	echo -e "-> Testando "$method" em $url \n" # Mensagem de apresentação
	
	echo "Resposta:"
  curl -X "$method" -s "$url" # Faz a solicitação
  echo ""
  
  create_footer_line # rodape
}

create_header_line() { printf '%*s \n' 70 '' | tr ' ' "-";} # Cria um cabeçalho

create_footer_line() { printf '\n %*s \n' 70 '' | tr ' ' "-";} # Cria um rodape

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

# ------------------------------------ Test ----------------------------------------

get https://api.restful-api.dev/objects/6

