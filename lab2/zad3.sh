#!/bin/bash

cd ~/desktop
mkdir test1 test2 kopia

cd test2
mkdir ../test1/test3

cd ../test1/test3
touch ../info1

cd ../../kopia
touch ../test1/info2

cd ../test2
cp -a ../test1/. ../kopia

cd ../kopia
rm ../test1/info1 ../test1/info2

cd ../test1
mv ../kopia/info1 ./info1 
mv ../kopia/info2 ./info2

tree ~/desktop
cat ~/desktop/test1/info1
cat ~/desktop/test1/info2

