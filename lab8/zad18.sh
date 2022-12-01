#!/bin/bash

cd /home/hkowalski/Desktop/ || exit

mkdir test && cd "$_" || exit

for cat in kat1 kat1/kat11 kat1/kat12 kopia archiwum rozpakowane; do
  mkdir $cat
done

for file in kat1/kat11/plik1 kat1/kat12/plik2 kat1/plik13; do
  touch $file
done

tree

cp -r ./kat1 kopia/kat1
tar -cf ./archiwum/kat1_arch.tar ./kat1/

cd rozpakowane || exit
tar -tf ../archiwum/kat1_arch.tar

cd ../
pwd
tar -xf archiwum/kat1_arch.tar -C rozpakowane/
rm -rf kopia/*

tree
