#!/bin/bash
# Converte todos os arquivos da pasta atual de mp4 para mp3

convertidos="Convertidos"
videos="Videos"

mkdir "$convertidos" # Cria a pasta convertidos
mkdir "$videos" # Cria a pasta com os videos antigos


for file in *.mp4; do # converte todos os mp4 da pasta atual em mp3
  	echo "Convertendo $file para mp3"
  	ffmpeg -i "$file" -v "warning" -vn -ar 44100 -ac 2 -b:a 96k Convertidos/"${file%.mp4}.mp3"
	mv "$file" "$videos/$file" # Move o video ja convertido para a pasta videos
	echo "Feito"
done
