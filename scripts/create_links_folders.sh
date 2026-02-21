#!bin/bash

# ------------------------------ Functions ----------------------------
eval home="~$USER" # recebe o path da home do usuario atual

backup="/files" # Path da pasta de backup do usuario


function create_link() {
  # parameters: msg; link_path; folder_path;
  link_path="$home/$2"
  folder_path="$backup/$3"

  echo "$1
  "

  if [[ -d "$link_path" && ! -L "$link_path" ]]; then
  # Se existir a pasta com o nome do link remove ela
    rm -r "$link_path"

  elif [ -L "$link_path" ]; then
  # Se ja existir um link remove ele 
    rm -f "$link_path"	
  fi

  ln -s "$folder_path" "$link_path" # Cria o link para a pasta no backup

}


# ------------------------------ Main ----------------------------
clear

echo "Começando...
"

create_link "Criando templates..." "Templates" "Projects/Templates"

create_link "Criando Backgrounds..." "Pictures/Backgrounds" "Pictures/Backgrounds"

create_link "Criando Documents..." "Documents" "Documents"

create_link "Criando Projects.." "PycharmProjects" "Projects"

echo "Bye..."

sleep 1

exit
