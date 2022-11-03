#!/bin/bash

groupadd gr1
groupadd gr2
groupadd gr3

useradd -m -g gr1 us1
useradd -m -g gr2 us2
useradd -m -g gr3 us3

cd /home/
mkdir -p us1/kat1a/kat1c
mkdir us1/kat1b
touch us1/kat1a/plik1a us1/kat1a/plik1b us1/kat1a/kat1c/plik1

mkdir us2/kat1a/
mkdir us2/kat1c/
mkdir us2/kat1b
touch us2/kat1a/plik1a
touch us2/kat1c/plik1

mkdir us3/kat1a
mkdir us3/kat1c
mkdir us3/kat1b
touch us3/plik1
touch us3/kat1a/plik1a

mkdir /home/hkowalski/Desktop/archiwum
mkdir /home/hkowalski/Desktop/rozpakowane

tar -cf hkowalski/Desktop/archiwum/us1_arch.tar ./us1/ 
tar -cf hkowalski/Desktop/archiwum/us2_arch.tar ./us2/ 
tar -cf hkowalski/Desktop/archiwum/us3_arch.tar ./us3/ 

cd hkowalski/Desktop 
tar -xf archiwum/us1_arch.tar -C ./rozpakowane/
tar -xf archiwum/us2_arch.tar -C ./rozpakowane/
tar -xf archiwum/us3_arch.tar -C ./rozpakowane/

tree ./

