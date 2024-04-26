#!/bin/bash

NEW='\033[1;38;5;154m'
PINK='\033[1;38;5;013m'
BLUE='\033[1;38;5;012m'
GREEN='\033[1;38;5;040m'
CG='\033[1;38;5;087m'
CPO='\033[1;38;5;205m'

echo -e ${GREEN}"\n"
figlet -f slant -c "CVE SCANNER" | lolcat && figlet -f digital -c "Version: 1.0" | lolcat
echo -e ${CPO}"\nTools: CVE Scanning"
sleep 1

echo -n -e ${CG} "\n\n\n[+] Enter your Filename: "
read filename

echo -e ${PINK}"\nCVE Scanning...\n"
subfinder -dL $filename --silent | nuclei -t /home/researcher/nuclei-templates/javascript/cves/2023/CVE-2023-48795.yaml
echo -e ${CPO}"\n\n                  Scanning has finished for $filename\n\n"
sleep 1

# Prompt user whether to run the command
read -p "Do you want to run this command again? (y/n): " run_commands
if [ "$run_commands" == "y" ]; then
    clear && ./CVE.sh
    echo "Started Again..."
fi
