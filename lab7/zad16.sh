#!/bin/bash

echo 'Podaj nazwę grupy: '
read -r group

echo 'Podaj nazwę użytkownika: '
read -r user

if grep -q "$user" /etc/passwd || grep -q "$group" /etc/group; then
  echo 'Użytkownik lub grupa istnieją.'
  exit 0
fi

groupadd "$group"
useradd -g "$group" -m "$user"

ls -l /home/"$user"

mkdir -p /home/"$user"/main/kat1
mkdir /home/"$user"/main/kat2
mkdir /home/"$user"/main/kat3

touch /home/"$user"/main/kat1/plik_1_1
touch /home/"$user"/main/kat1/plik_1_2
touch /home/"$user"/main/kat3/plik_1_2

cd /home || exit
mkdir ./backup
tar -cf /home/backup/archiwum.tar "$user"/

cd /home/backup || exit
tree .
tar -tf ./archiwum.tar

cd /home || exit
rm -rf ./backup
