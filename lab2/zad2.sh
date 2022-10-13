#!/bin/bash

cd ~/Desktop
mkdir test_a test_b test_c

echo "tekst_a" > ./test_a/plik_a
echo "tekst_b" > ./test_b/plik_b
echo "tekst_c" > ./test_c/plik_c

mkdir ./kopia
cp -r test_a test_b test_c ./kopia

mkdir ./move1
mv test_a test_b test_c ./move1

tree
