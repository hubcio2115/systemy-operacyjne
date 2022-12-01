#!/bin/bash

for group in gr1 gr2 gr3; do
  groupadd $group
  useradd -m us${group: -1} -G $group
done

cd /home/us1 || exit

for cat in kat11/kat13 kat12; do
  mkdir -p $cat
done

cd kat11 || exit

for file in plik1 plik2 kat13/plik3; do
  touch $file
done

cd /home/us2 || exit

for cat in kat11 kat12 kat13; do
  mkdir $cat
done

for file in kat11/plik1 kat12/plik2; do
  touch $file
done

cd /home/us3 || exit

for cat in kat11 kat12 kat13; do
  mkdir $cat
done

for file in plik1 plik2; do
  touch $file
done

mkdir /archiwum /rozpakowane

cd /home || exit

tar -cf /archiwum/us1_arch.tar ./us1
tar -cf /archiwum/us2_arch.tar ./us2
tar -cf /archiwum/us3_arch.tar ./us3

cd /

for arch in ./archiwum/us1_arch.tar ./archiwum/us2_arch.tar /archiwum/us3_arch.tar; do
  tar -xf $arch -C ./rozpakowane/
done

tree ./rozpakowane
