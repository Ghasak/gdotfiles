#!/usr/bin/env bash

function bannerSimple() {
    local msg="${2} ${1} ${2}"
    local edge=$(echo "${msg}" | sed "s/./"${2}"/g")
    echo "${edge}"
    echo "$(tput bold)${msg}$(tput sgr0)"
    echo "${edge}"
    echo
}

function cleanTypeScriptFilesInDir() {

cat  << EOF
---------------------------------------------------------------------
▀█▀ █▄█ █▀█ █▀▀ █▀ █▀▀ █▀█ █ █▀█ ▀█▀   █▀▀ █░░ █▀▀ ▄▀█ █▄░█ █▀▀ █▀█
░█░ ░█░ █▀▀ ██▄ ▄█ █▄▄ █▀▄ █ █▀▀ ░█░   █▄▄ █▄▄ ██▄ █▀█ █░▀█ ██▄ █▀▄
---------------------------------------------------------------------
                      =  RUN AS SCRIPT =
This is a script will search for redandent file and clean it which match
a pattern given inside top of the file that we want to clean

    Parameter: It asks you for the word located in the top of the file to
               identify and not remove other necessary similar files.

---------------------------------------------------------------------
EOF
    bannerSimple " Running the script " "*" | lolcat
    echo ""
    echo -n "=> [+] " | lolcat && echo -n "  " | lolcat && read -p "What is the redundant file name to be cleaned [Default:typescript] ... "  FILETYPE
    FILETYPE=$(echo "${FILETYPE:=typescript}")
    echo -n "=> [+]   " | lolcat && echo -n "ﯨ  " | lolcat   && read -p "First word at second line of file is : [Default:Script] ... "  SEARCHING_WORD
    SEARCHING_WORD=$(echo "${SEARCHING_WORD:=Uptime}")
    bannerSimple " [O]   The following files Will be removed [Type]: ${FILETYPE} " "+" | lolcat
    local NUMBER_OF_FILES=0
    for file in $(find . -type f -name $FILETYPE -ls); do
        if [ -f $file ]; then
          echo -e "\e[31m'$(head -n 5 $file)'\e[0m' "
            CHECK1=$(head $file | grep $SEARCHING_WORD | awk -F ':' '{print $1}')
            let NUMBER_OF_FILES=NUMBER_OF_FILES+1
            if [ $CHECK1 = $SEARCHING_WORD ]; then
                echo "=> [-]   $NUMBER_OF_FILES : $file" | lolcat
                rm -rf $file
            fi
        fi
    done

}

cleanTypeScriptFilesInDir

