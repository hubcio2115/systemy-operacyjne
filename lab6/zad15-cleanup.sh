#!/bin/bash

userdel -r user1 
userdel -r user2 
userdel -r user3

groupdel gr1 
groupdel gr2
groupdel gr3 

rm -rf /Archiwum-user1 /Archiwum-user2 /Archiwum-user3
rm -rf /root/backup
