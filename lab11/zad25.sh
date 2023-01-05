#!/bin/bash

read -ra grouparr -p "Podaj trzy nazwy grup oddzielone spacją: "
read -ra userarr -p "Podaj trzy nazwy użytkowników oddzielone spacją: "

for i in 0 1 2; do
  echo "${userarr[i]}, ${grouparr[i]}" >>out.txt
done

cat ./out.txt

existingUsers=()
existingGroups=()

for i in 0 1 2; do
  if getent passwd "${userarr[i]}"; then
    existingUsers+=("${userarr[i]}")
  fi

  if getent group "${grouparr[i]}"; then
    existingGroups+=("${grouparr[i]}")
  fi
done

echo existingUsers
echo existingGroups

randomIndex=$((RANDOM % 3))

# groupadd "${grouparr[randomIndex]}"
# useradd -g "${grouparr[randomIndex]}" -m "${userarr[randomIndex]}"
