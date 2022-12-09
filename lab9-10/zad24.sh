#!/bin/bash

for i in 1 2 3; do
  mkdir -p /root1/katalog$i
done

touch /root1/katalog1/plik1
touch /root1/katalog1/plik2
touch /root1/katalog3/plik3

read -rp "Poraj ścieżkę absolutną do katalogu, który ma zostać zarchiwizowany: " dirPath

if [ ! -d "$dirPath" ]; then
  echo 'Podany katalog nie istnieje'
  exit 1
fi

IFS='/'
read -ra patharr <<<"$dirPath"

mkdir /archiwumm
tar -cf /archiwum/"${patharr[-1]}".tar "$dirPath"

mkdir /kopia

read -rp "Poraj ścieżkę absolutną do katalogu, który ma zostać skopiowany: " dirPath

if [ ! -d "$dirPath" ]; then
  echo 'Podany katalog nie istnieje'
  exit 1
fi

read -ra patharr <<<"$dirPath"
cp "$dirPath" /kopia/"${patharr[-1]}"_bakup

rm -rf /archiwum /kopia /root1
