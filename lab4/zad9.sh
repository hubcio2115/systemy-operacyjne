#!/bin/bash

groupadd g1
groupadd g2
groupadd g3

useradd -m -g g1 u1
useradd -m -g g2 u2
useradd -m -g g3 u3

cd /home

mkdir /home/u1/test1
touch /home/u1/test1/plik_info1
touch /home/u1/test1/plik_data1

mkdir /home/u2/test2

mkdir /home/u3/abc3
touch /home/u3/abc3/plik_info3

cp /home/u1/test1/plik_info1 /home/u2/test2/plik_info1
cp /home/u1/test1/plik_data1 /home/u3/abc3/plik_data1

mkdir kopia
cp -r /home/u1 /home/u2 /home/u3 /home/kopia/
tree /home

date > /home/u1/test1/plik_data1
cat /home/u1/test1/plik_data1

userdel -rf u1
userdel -rf u2
userdel -rf u3

groupdel g1
groupdel g2
groupdel g3
