#!/bin/bash
source "$(dirname "${BASH_SOURCE[0]}")/test_url.sh" # Importa as funçoes do test_url


# --------------------------- Chama as funções que devem ser executadas ----------------------------
get https://api.restful-api.dev/objects/6

