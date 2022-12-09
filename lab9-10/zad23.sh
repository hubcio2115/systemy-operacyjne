#!/bin/bash

grouparr=()
userarr=()

for i in 1 2 3; do
  read -rp "Podaj nazwę nowej grupy ${i}: " gr
  read -rp "Podaj nazwę użytkownika ${i}: " us

  if getent passwd "$us" || getent group "$gr"; then
    echo "Użytkownik $us i/lub grupa $gr już istnieją"
    exit 0
  fi

  grouparr+=("$gr")
  userarr+=("$us")
done

echo "${grouparr[@]}"
echo "${userarr[@]}"

for gr in "${grouparr[@]}"; do
  groupadd "$gr"
done

mkdir -p /wszyscy/tar
mkdir /wszyscy/backup
mkdir /wszyscy/rozpakowane

for i in 0 1 2; do
  useradd "${userarr[$i]}" -g "${grouparr[$i]}"

  mkdir /home/"${userarr[$i]}"

  for j in 1 2 3; do
    mkdir /home/"${userarr[$i]}"/katalog$j
    touch /home/"${userarr[$i]}"/katalog$j/plik$j
  done

  tree /home/"${userarr[$i]}"/

  cd /home/"${userarr[$i]}" || exit
  for kat in katalog1 katalog2 katalog3; do
    tar -cf /wszyscy/tar/"${userarr[$i]}"_"$kat".tar "$kat"

    cp -r /home/"${userarr[$i]}"/"$kat" /wszyscy/backup/"${userarr[$i]}"_"$kat"

    tar -xf /wszyscy/tar/"${userarr[$i]}"_"$kat".tar -C /wszyscy/rozpakowane/
  done

  userdel -r "${userarr[$i]}"
  groupdel "${grouparr[$i]}"

done

chown -R root:root /wszyscy/*

ls -ld /wszyscy/tar
ls -ld /wszyscy/rozpakowane
ls -ld /wszyscy/backup

rm -rf /wszyscy

tree /home
