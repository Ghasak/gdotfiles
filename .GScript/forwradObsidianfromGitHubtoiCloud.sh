#! /bin/bash
#----------------------------------------------------------------------------------#
# - [X] Create an input directory for the directory from your machine to the
#       other directory on the server machine .
# - [X] We need Several tabs and how you can switch between them.
# - [X] adding more features
#----------------------------------------------------------------------------------#

echo "
#----------------------------------------------------------------------------------#

█▀█ █▀ █▄█ █▄░█ █▀▀   █▀█ █▄▄ █▀ █ █▀▄ █ ▄▀█ █▄░█   ▀█▀ █▀█   █ █▀▀ █░░ █▀█ █░█ █▀▄
█▀▄ ▄█ ░█░ █░▀█ █▄▄   █▄█ █▄█ ▄█ █ █▄▀ █ █▀█ █░▀█   ░█░ █▄█   █ █▄▄ █▄▄ █▄█ █▄█ █▄▀
𝔊𝔥𝔞𝔰𝔞𝔨
#----------------------------------------------------------------------------------#
" | lolcat

while [ : ]
do
        # By Defulat I will sync my Repository of my Current MacBookHome to my iCloud
        echo -n "[rsync] input machine [default :MacBookHome]: "
        read input1; input_1=${input_1:-MacBookHome}; echo $input_1;
        workSpaceDir="$HOME/Library/Mobile Documents/iCloud~com~coderforart~iOS~MWeb/Documents/ObsidianColud/"
        echo -n "[rysnc] input workspace [default : iCloud]"
        read workspace; workspace=${workspace:-workSpaceDir}; echo $workSpaceDir;
        echo "Current Directory: ${workspace}"


        case $input_1 in
                MacBookHome) # --exclude=.git/ :: if you want to not include, must put after -auxv
                        rsync -auxv  --delete -e '/usr/bin/ssh'  $HOME/Documents/myObsidianDoc/ "$workSpaceDir"
                        echo "[+] rsync success $input_1"
                        break;;
                *)
                        echo "[!] input correct machine"
                        ;;
        esac
done




