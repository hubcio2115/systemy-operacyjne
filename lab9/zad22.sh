#!/bin/bash

read -rp 'Podaj nazwę nowej grupy' group
read -rp 'Podaj nazwę użytkownika' user

if getent passwd "$user" || getent group "$group"; then
  echo 'Użytkownik i/lub grupa już istnieją'
  exit 0
fi

grouparr=("$group")
userarr=("$userarr")

echo "${grouparr[@]}"
echo "${userarr[@]}"

groupadd "${grouparr[0]}"
useradd -m -G "${grouparr[0]}" "${userarr[0]}"

cd /home/"${userarr[0]}" || exit

for cat in katalog1 katalog2 katalog3; do
  mkdir $cat
done

for file in katalog1/plik1 katalog1/plik2 katalog3/plik3; do
  touch $file
done

tree
mkdir tar

tar -cf ./tar/katalog1.tar ./katalog1
tar -cf ./tar/katalog2.tar ./katalog2
tar -cf ./tar/katalog3.tar ./katalog3

mkdir backup
cp -r ./katalog1 ./katalog2 ./katalog3 ./backup/

chown -R root ./*
chgrp -R root ./*

for cat in tar backup rozpakowane; do
  ls -ld $cat
  rm -rf ./$cat
done

userdel -r "${userarr[0]}"
groupdel "${grouparr[0]}"
