#! /bin/bash

# - [ ] Create an input directory for the directory from your machine to the
#       other directory on the server machine .
echo "
█▀█ █▀ █▄█ █▄░█ █▀▀   █░█░█ █▀█ █▀█ █▄▀ ▄▄ █░█ █▀█ █▀▄▀█ █▀▀
█▀▄ ▄█ ░█░ █░▀█ █▄▄   ▀▄▀▄▀ █▄█ █▀▄ █░█ ░░ █▀█ █▄█ █░▀░█ ██▄
"

while [ : ]
do
        echo -n "[rsync] input machine [suggestion server1]: "
        read input1; input_1=${input_1:-MacBookHome}; echo $input_1;
        #echo -n "[rsync] input machine [suggestion server1]: "
        #read  input_1
        workSpaceDir="/Users/ghasak/Library/Mobile\ Documents/com~apple~CloudDocs/ObsidianCloud/GData"
        echo -n "[rysnc] input workspace [defalut : iCloud]"
        read workspace; workspace=${workspace:-workSpaceDir}; echo $workSpaceDir;
        #echo -n "[rsync] input workspace [suggestion:/Users/ghasak/Library/Mobile Documents/com~apple~CloudDocs/ObsidianCloud/GData] "
        #read workspace
        echo "Current Directory: ${workspace}"
        case $input_1 in
                MacBookHome)
                        rsync -auxv --delete -e '/usr/bin/ssh' /Users/ghasak.ibrahim/Documents/OBSIDINDIRWORK/GData ghasak@$input_1:"$workSpaceDir"
                        echo "[+] rsync success $input_1"
                        break;;
#        case $input_1 in
#            server1)
#                        rsync -auxv  --exclude 'notebook/*' --delete -e '/usr/bin/ssh' /Users/ghasak/Desktop/$workspace ghasak@$input_1:~/Desktop
#                        echo "[+] rsync success $input_1"
#                        break;;
                *)
                        echo "[!] input correct machine"
                        ;;
#        esac
        esac
done


# - [ ] We need Several tabs and how you can switch between them.
# - [ ] adding more features

