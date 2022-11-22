#!/bin/bash

for user in test1 test2 test3; do
  if grep -q "$user" /etc/passwd; then
    echo "Użytkownicy już istnieją."
    exit 0
  fi
done

for group in gr_test1 gr_test2 gr_test3; do
  if grep -q "$group" /etc/group; then
    echo "Grupy już istnieją."
    exit 0
  fi
done

groupadd gr_test1
groupadd gr_test2
groupadd gr_test3

useradd -m -G gr_test1 test1
useradd -m -G gr_test2 test2
useradd -m -G gr_test3 test3

mkdir -p /home/test1/kat1
touch /home/test1/kat1/plik_info1 /home/test1/kat1/plik_data1

mkdir -p /home/test2/kat2
touch /home/test2/plik_info2 /home/test2/plik_data2
mkdir -p /home/test2/kat2_2

mkdir -p /home/test3/kat3_3
touch /home/test3/kat3_3/plik_info3 /home/test3/kat3_3/plik_data3

chmod 765 /home/test1/kat1
chmod 756 /home/test2/kat2_2
chmod 765 /home/test3/kat3_3

ls -ld /home/test1/kat1
ls -ld /home/test2/kat2_2
ls -ld /home/test3/kat3_3

mkdir /backup

cd /home || exit
tar -cf /backup/test1.tar test1/
tar -cf /backup/test2.tar test2/
tar -cf /backup/test3.tar test3/

tar -tf /backup/test1.tar
tar -tf /backup/test2.tar
tar -tf /backup/test3.tar

ls -l /backup/

ls -l /home/test1/
ls -l /home/test2/
ls -l /home/test3/
