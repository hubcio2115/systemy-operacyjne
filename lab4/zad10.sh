#!/bin/bash

groupadd g1
groupadd g2
groupadd g3

useradd -m -g g1 u1
useradd -m -g g2 u2
useradd -m -g g3 u3

cd /home

mkdir /home/u1/u1
touch /home/u1/u1/plik_info1
touch /home/u1/u1/plik_data1

mkdir /home/u2/u2/

mkdir /home/u3/u3/
touch /home/u3/u3/plik_info3

chmod 444 /home/u1/u1
chmod 444 /home/u2/u2
chmod 444 /home/u3/u3

ls -l /home/u1/
ls -l /home/u2/
ls -l /home/u3/

echo

chmod 460 /home/u1/u1
chmod 044 /home/u2/u2
chmod 606 /home/u3/u3

ls -l /home/u1/
ls -l /home/u2/
ls -l /home/u3/

userdel -rf u1
userdel -rf u2
userdel -rf u3

groupdel g1
groupdel g2
groupdel g3
