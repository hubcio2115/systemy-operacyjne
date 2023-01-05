#!/bin/bash

usr=''
group=''

printOpening() {
  printf "1. Podaj nazwę użytkownika
2. Sprawdź czy wcześniej podany użytkownik i grupa istnieją
3. Stwórz wcześniej podaną grupę i użytkownika jeżeli jeszcze nie istnieją i wyświetl zawartość /home
4. Usuń stworzonego użytkownika i grupę
5. Wyjdź
"
}

checkIfUsrExists() {
  if getent passwd "$1"; then
    echo "Podany użytkownik istnieje"
  fi
}

checkIfGroupExists() {
  if getent group "$1"; then
    echo "Podany użytkownik i/lub grupa istnieją"
  fi
}

while true; do
  printOpening
  echo
  read -r -p 'Podaj opcje: ' odp

  case $odp in
  '1')
    read -r -p "Podaj nazwę użytkownika: " usr
    read -r -p "Podaj nazwę grupy: " group
    ;;
  '2')
    if [ "$usr" == '' ] || [ "$group" == '' ]; then
      echo "Nazwa użytkownika i/lub grupa nie zostały podane"
      continue
    fi

    checkIfUsrExists "$usr"

    checkIfGroupExists "$group"
    ;;
  '3')
    checkIfUsrExists "$usr"
    checkIfGroupExists "$group"

    groupadd "$group"
    useradd -m -g "$group" "$usr"

    ls -l /home
    ;;
  '4')
    userdel -r "$usr"
    groupdel "$group"
    ;;
  '5') exit 0 ;;
  esac
done
