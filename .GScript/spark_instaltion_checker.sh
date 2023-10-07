#!/usr/bin/env bash

TITLE="Compile and watch on system: $HOSTNAME"
RIGHT_NOW="$(date +"%x %r %Z")"
CREAT_TIME_STAMP="Updated on $RIGHT_NOW by $USER"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
YELLOW='\033[0;33m'
GRAY="\e[37m"
BLUE="\e[34m"
LIGHT_YELLOW="\e[93m"
ENDCOLOR="\e[0m"
NC='\033[0m' # No Color
TIME_STAMP=$(date +%Y-%m-%d-%H%M%S)

lib_installed=('java' 'scala' 'hadoop' 'sbt' 'spark-shell' 'pyspark')
count_lib=0
for item in "${lib_installed[@]}"; do
    ((count_lib++))
    printf '=%.0s' {1..100}
    echo ""
    echo -e "[$RED$count_lib$NC] ---> $YELLOW$item$NC"
    printf '=%.0s' {1..100}
    echo ""

    if [[ "$item" == "java" ]]; then
        "$item" -version
    elif [[ "$item" == "hadoop" ]]; then
        "$item" version
    else
        "$item" --version
    fi
done
printf '=%.0s' {1..100}
echo
