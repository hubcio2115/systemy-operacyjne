#!/bin/bash

cat ./out.txt

echo

read -rp "Podaj nazwę użytkownika: " us
read -rp "Podaj nazwę grupy: " gr

userarr=()
grouparr=()

while read -r line; do
  IFS=', '
  read -r -a temp <<<"$line"

  userarr+=("${temp[0]}")
  grouparr+=("${temp[1]}")

done <out.txt

for i in 0 1 2; do
  if [[ "${userarr[i]}" =~ ${us} ]] && [[ "${grouparr[i]}" =~ ${gr} ]]; then
    if getent passwd "$us" || getent group "$gr"; then
      echo "Podany użytkownik i/lub grupa istnieją"
      exit 0
    fi

    groupadd "$gr"
    useradd -g "$gr" -m "$us"

    ls -ld /home/"$us"

    userdel -r "$us"
    groupdel "$gr"

    rm /home/hkowalski/Desktop/lab11/out.txt
  fi

done

echo "Podanej nazwy użytkownika lub grupy nie ma w pliku out.txt"
