#!/usr/bin/env bash
# ---------------------------------------------------------------------
set -Eeuo pipefail
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

echo "====================================================================" | lolcat 2>&1
exec echo "
                    ███████╗██╗░░░██╗
                    ██╔════╝╚██╗░██╔╝
                    █████╗░░░╚████╔╝░
                    ██╔══╝░░░░╚██╔╝░░
                    ███████╗░░░██║░░░
                    ╚══════╝░░░╚═╝░░░
            ▒█▀▀█ █▀▀█ █▀▀█ ░░▀ █▀▀ █▀▀ ▀▀█▀▀ 　
            ▒█▄▄█ █▄▄▀ █░░█ ░░█ █▀▀ █░░ ░░█░░ 　
            ▒█░░░ ▀░▀▀ ▀▀▀▀ █▄█ ▀▀▀ ▀▀▀ ░░▀░░ 　

  ▒█▀▀█ █▀▀█ █▀▀▄ █▀▀ ▀▀█▀▀ █▀▀█ █░░█ █▀▀ ▀▀█▀▀ ░▀░ █▀▀█ █▀▀▄
  ▒█░░░ █░░█ █░░█ ▀▀█ ░░█░░ █▄▄▀ █░░█ █░░ ░░█░░ ▀█▀ █░░█ █░░█
  ▒█▄▄█ ▀▀▀▀ ▀░░▀ ▀▀▀ ░░▀░░ ▀░▀▀ ░▀▀▀ ▀▀▀ ░░▀░░ ▀▀▀ ▀▀▀▀ ▀░░▀
" | lolcat 2>&1

echo "====================================================================" | lolcat 2>&1

usage() {
cat << EOF

  # ---------------------------------------------------------------------
  # - [X] Check the Operation system.
        - Work on macOS, to be extended to Linux very soon!
  # - [X] Check if brew is installed or not.
  # - [X] Check if python3 installed.
  # - [X] Check if pipenv installed.
  # - [X] Check after the installing requirements. with pipenv
  # - [X] Check the Environment variables.
  # - [X] Automate the other scripts
  # - [X] Move to jupternotebook
  # - [x] Move to docker and dockerfiles
  # - [X] Move to R and export to jupyternotebook
  # - [x] Move to Julia and export to jupyternotebook
  # ---------------------------------------------------------------------

# Copyright © 2021  Ghasak Ibrahim
# All rights reserved

EOF
}

# MIT License
# Copyright (C) 2013 copyright holder
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
usage | lolcat

date=$(date '+%Y-%m-%d')
echo "Current Date : ${date}" | lolcat 2>&1
# ---------------------------------------------------------------------
#
# ---------------------------------------------------------------------

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Running ${OSTYPE} Linux-Gnu"
  cat /etc/os-release
elif [[ "$OSTYPE" == "darwin"* ]]; then
  exec echo "Running ${OSTYPE} macOSX" | lolcat 2>&1
  #cat /System/Library/CoreServices/SystemVersion.plist
  #exec echo $(sw_vers) | lolcat 2>&1
  #| sed 's/10//')
  exec echo $(sw_vers -productName && sw_vers -productVersion) | lolcat 2>&1
  # case "$OSTYPE" in
  #   solaris*) echo "SOLARIS" ;;
  #   darwin*)  echo "macOSX: ${OSTYPE}" ;;
  #   linux*)   echo "LINUX" ;;
  #   bsd*)     echo "BSD" ;;
  #   msys*)    echo "WINDOWS" ;;
  #   *)        echo "unknown: $OSTYPE" ;;
  # esac
else
  echo "Unkown Systm!!"| lolcat 2>&1
fi

# ---------------------------------------------------------------------
which -s brew

if [[ $? != 0 ]] ; then
    # Install Homebrew
    exec ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2>&1
else
  echo "[->] Do you like to upgrade and update homebrew ... "  | pv -qL 20
  read -p "Ans.) [yes/no] [default : yes] " ANSWER1
  ANSWER1=${ANSWER1:-yes}
  ANSWER1=$(echo $ANSWER1 | tr '[:upper:]' '[:lower:]')
   if [ $ANSWER1 = 'yes' ]  || [ $ANSWER1 = 'y' ]; then
     echo "-> [O] Upgrading Homebrew Now !!!" | lolcat 2>&1
     brew upgrade
     brew update
     PACK01=$(which -s pv)
     if [ -n $PACK01 ]; then
         brew install pv
     fi
   fi

  echo "[->] Must install some Utilities... wget, lolcat, boxes, bat "  | pv -qL 20

   S1=$(which  -s wget)
    if [ -n "$S1" ] ; then
      brew install wget
      echo "I am inside the wget"
    fi

   S1=$(which -s lolcat)
    if [ -n "$S1" ] ; then
      brew install  lolcat
    fi

   S1=$(which -s bat)
    if [ -n "$S1" ] ; then
      brew install bat
    fi

   S1=$(which -s boxes)
    if [ -n "$S1" ] ; then
      brew install boxes
    fi

#     if brew ls --versions apple-juice > /dev/null; then
#       echo "apple-juice is already installed"
#     else
#       echo "Installing apple-juice app ...! "
#       brew install apple-juice
#     fi

   S1=$(which -s R)
    if [ -n "$S1" ] ; then
      # Install R (this is a differnt from the one comes with Anaconda)
      # https://apple.stackexchange.com/questions/72226/installing-pkg-with-terminal
      curl https://cran.r-project.org/bin/macosx/base/R-4.1.0.pkg -o ~/Desktop/R-4.1.0.pkg
      # This will intall R in the ~/Applications
      exec installer -pkg ~/Desktop/R-4.1.0.pkg -target CurrentuserHomeDirectory 2>&1
    fi


fi

# ---------------------------------------------------------------------
#                   CHECKING ANACONDA INSTALLTION
# ---------------------------------------------------------------------
which -s anaconda
if [[ $? != 0 ]] ; then
  # Install python3
  # Download from here: https://repo.anaconda.com/archive/
  exec curl https://repo.anaconda.com/archive/Anaconda-1.4.0-MacOSX-x86_64.sh -o ~/Downloads/anaconda.sh 2>&1
  exec bash ~/Downloads/anaconda.sh -b -p $HOME/opt/anaconda3/bin/anaconda | lolcat 2>&1
else
  # Passing the check
  ANACONDA_VERSION=$(anaconda --version)
  echo "-> [O] Anaconda is already Installed : ${ANACONDA_VERSION}" | lolcat 2>&1
fi

# ---------------------------------------------------------------------
#               CHECKING PIPENV INSTALLTION
#              Hint: Tested and it is working
# ---------------------------------------------------------------------
S1=$(which pipenv)
if [ -z $S1 ] ; then # -z or -n to check if empty string
  # Install pipenv
  echo "-> [X] pipenv is Not Installed ... will be installed now!!"| lolcat 2>&1
  exec pip install pipenv 2>&1
else
  PACK02=$(pipenv --version)
  echo "-> [O] ${PACK02} is already installed " | lolcat 2>&1
fi

# ---------------------------------------------------------------------
#                BUILD THE PROJECT STRUCTURE
#       Including all files, directories and sub-modules
# ---------------------------------------------------------------------

# - [X] Install the virtualenv
# - [X] Activate the virtualenv.
# - [X] Check if vitualenv is activate
# - [X] Check if the Pipfile and Pipefile.lock are there already
# - [X] Check if the requirements are already there

PRO_DIRS="temp src notebook note lib database references"
PRO_FILES=".gitignore .envrc .env README.md Dockerfile"
PRO_SUBFILES="main.py test.py"

# ---------------------------------------------------------------------
#                       Initial libraries
# ---------------------------------------------------------------------
LIBRARIES="numpy"

# ---------------------------------------------------------------------
PIPENV_VERSION=$(pipenv --version)
# ---------------------------------------------------------------------

for dir in ${PRO_DIRS};do
  echo "-> [+] Creating a direcotry ${dir}" | lolcat 2>&1
  mkdir $dir
done

for filex in ${PRO_FILES}; do
  echo "-> [+] Creating file ${filex}" | lolcat 2>&1
  touch $filex
done

for subflix in ${PRO_SUBFILES}; do
  echo "-> [+] Creating subfiles ${subflix}" | lolcat 2>&1
  touch ./src/${subflix}
done

# This will be loaded once the virtualenv is activated
# You can change the structure later in the .env
# Similarly, you can also use the (direnv) with (.envrc) to store your Environment variables
echo "export PYTHONPATH=\$PYTHONPATH:\$(pwd):\$(pwd)/develop/:\$(pwd)/develop/src:\$(pwd)/services/:\$(pwd)/services/src:" > .env
# Example of Secret Environment Variables
echo "SECRET_KEY=\"MySuperSecretKey\"" >> .env
# Run this to get the environment variables
# pipenv run python -c "import os ; print(os.environ['SECRET_KEY'])"

