#!/bin/bash

read -r -p "Proszę podać nazwę użytkownika: " usr
read -r -p "Proszę o podanie nazwy grupy: " group

if getent passwd "$usr" || getent group "$group"; then
  echo "Podany użytkownik i/lub grupa istnieją"
  exit 0
fi

fn() {
  groupadd "$group"
  useradd -m -g "$group" "$usr"
}

fn

{
  echo "użytkownik: $usr"
  echo "grupa: $group"
} >>/home/hkowalski/Desktop/lab13/plik.txt

ls -l /home

userdel -r "$usr"
groupdel "$group"
rm /home/hkowalski/Desktop/lab13/plik.txt
