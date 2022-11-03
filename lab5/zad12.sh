#!/bin/bash

rm -rf /home/hkowalski/Desktop/*

cd /home/hkowalski/Desktop/

mkdir -p kat1/kat1a/kat1c
mkdir kat1/kat1b

touch kat1/plik1
touch kat1/kat1a/plik1a
touch kat1/kat1a/plik1b

mkdir kopia
mkdir archiwum
mkdir rozpakowane

tree /home/hkowalski/Desktop/

cd ./kat1/kat1a/kat1c
cp -r /home/hkowalski/Desktop/kat1/ /home/hkowalski/Desktop/kopia/

cd /home/hkowalski/Desktop/
tar -cf  ./archiwum/kat1_arch.tar ./kat1

cd kat1/kat1a/kat1c/
tar -tf /home/hkowalski/Desktop/archiwum/kat1_arch.tar

cd ../kat1b
tar -xf /home/hkowalski/Desktop/archiwum/kat1_arch.tar -C /home/hkowalski/Desktop/rozpakowane/
rm -rf /home/hkowalski/Desktop/kopia/*

tree /home/hkowalski/Desktop/

