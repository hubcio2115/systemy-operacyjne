#!/bin/bash

cd /home/hkowalski/Desktop/ || exit
rm -rf test/* && cd test || exit

for cat in kat1 kat1/kat12 kat1/kat13 kat1/kat12/kat14 kopia archiwum rozpakowane; do
  mkdir $cat
done

cd kat1 || exit

for file in plik11 kat12/plik12 kat12/plik14; do
  touch $file
done

cd ../

cp -r ./kat1 ./kopia

tar -cf ./archiwum/kat1_arch.tar ./kat1/

cd kat1/kat12/kat14 || exit
tar -tf ../../../archiwum/kat1_arch.tar
cd ../../../

tar -xf ./archiwum/kat1_arch.tar -C ./rozpakowane && rm -rf kopia/*
tree
