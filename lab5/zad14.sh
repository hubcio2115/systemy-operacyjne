#!/bin/bash

cd /home/hkowalski/Desktop/

mkdir -p kat1/kat1a
mkdir kat1/kat1b
touch kat1/plik1 kat1/kat1a/plik1a kat1/kat1b/plik1b

mkdir kopia archiwum rozpakowane

tree ./

cd kat1/kat1b/
cp -r  ../../kat1 ../../kopia/

cd ../../
tar -cf ./archiwum/kat1_arch.tar ./kat1/

cd rozpakowane
tar -tf ../archiwum/kat1_arch.tar

cd ../kat1/kat1b
tar -xf ../../archiwum/kat1_arch.tar -C ../../rozpakowane/
rm -rf /home/hkowalski/Desktop/kopia/*

tree /home/hkowalski/Desktop/

