#!/bin/bash

path='/home/hkowalski/Desktop/lab13/plik.txt'
chmod 647 "$path"

showFileRights() {
  ls -l "$1"
}

changeRights() {
  chmod "$1" "$2"
}

printOpening() {
  printf "1. Pokaż prawa do pliku
2. Zmień prawa na rwx
3. Zmień prawa na rw-
4. Zmień prawa na r--
5. Zmień prawa na ---
6. Wyjdź
"
}

while true; do
  printOpening
  echo
  read -r -p "Opcja: " odp

  case $odp in
  '1') showFileRights $path ;;
  '2') changeRights 777 $path ;;
  '3') changeRights 666 $path ;;
  '4') changeRights 444 $path ;;
  '5') changeRights 000 $path ;;
  '6') exit 0 ;;
  esac
done
