#!/bin/bash

cd ~/Desktop
mkdir test

touch ./test/info1
echo "Hubert Kowalski" > ./test/info1

touch ./test/info2
date > ./test/info2

mkdir kopia

cd ./test
cp ./info2 ../kopia/info2

cd ../kopia
mv ./info2 ./info3

echo "INFORMATYKA" > ./info3

cp ./info3 ../test/info3
mv ../test/info3 ../test/info4

cd ~ 
tree ./desktop/

cat ./desktop/test/info1
cat ./desktop/test/info4

