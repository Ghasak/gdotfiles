#!/usr/bin/env bash

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

" | lolcat 2>&1

echo "====================================================================" | lolcat 2>&1

usage() {
cat << EOF

  # ---------------------------------------------------------------------
  # - [c] Install necessary libraries for our current directory.
       - Install necessary libraries for our given workflow.
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
  SYSTEM_LINUX_FLAG=true
elif [[ "$OSTYPE" == "darwin"* ]]; then
  SYSTEM_MAC_FLAG=true
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

if [ $SYSTEM_MAC_FLAG = true ]; then
  echo "Now Installing all the requirements for the container ... "
  pip install -r requirements.txt

fi
