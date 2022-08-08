#!/usr/bin/env bash

RED="\e[31m"
GREEN="\e[32m"
LIGHT_YELLOW="\e[93m"
BLUE="\e[34m"
PURPLE="\e[35m"
ENDCOLOR="\e[0m"
CYAN="\e[36m"
STATS=0

# macosTags read ./$1/* --verbose >./artifacts.txt
# input="./artifacts.txt"

usage() {
    cat <<EOF
usage: $0 options iprange

OPTIONS:
   -h, --help           show this help.

EOF
}


pdfDeepSearch(){
  rga -i -L -n  --no-messages --column -F --stats "$1"
  }

rga -i -L -n  --no-messages --column -F --stats "$1" > ./artifacts.txt
input="./artifacts.txt"
while [ "$1" != "" ]; do
    input=$(echo $(rga -i -L -n  --no-messages --column -F --stats "$2"))
    case $1 in
    -d | --display)
        while IFS= read -r line;  do
            echo -e "${GREEN}$line${ENDCOLOR}\n"
            echo "\n"
        done <"$input"
        break
        ;;

    esac
done

