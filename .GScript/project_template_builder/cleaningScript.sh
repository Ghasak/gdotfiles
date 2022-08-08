#!/usr/bin/env bash

set -Eeuo pipefail
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

PRO_DIRS="temp src notebook note lib database references"
PRO_FILES=".gitignore .envrc .env requirement.txt README.md"
PRO_SUBFILES="main.py test.py"

for dir in ${PRO_DIRS};do
  echo "-> [-] Creating a direcotry ${dir}" | lolcat 2>&1
  rm -rf $dir
done

for filex in ${PRO_FILES}; do
  echo "-> [-] Creating file ${filex}" | lolcat 2>&1
  rm -rf $filex
done


