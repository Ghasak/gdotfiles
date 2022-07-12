#!/usr/bin/env bash

##############################
# Printing usage-information #
##############################
function printError() {
  echo "================"
  echo "usage: pdfsearch -p <pdf-file-folder> -q <term>"
  echo ""
  earcho "-h --help 	Print help"
  echo "-p 		Directory containing all pdf-files you want to be searched."
  echo "-s 		Specified query-term you want find."
  echo ""
}
#printError

if [ ! "$#" -gt 0 ]; then
  echo "Need a string to search for!"
  return 1
fi
if [ "$1" = '-h' ] || [ "$1" = "--help" ]; then
  echo "selected Help"

fi

if [ "$1" = "-r" ] || [ "$1" = "--Regular" ]; then
  rg --files-with-matches --no-messages "$2" | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$2' {}"
fi

if [ "$1" = "-s" ] || [ "$1" = "--Silver" ]; then
  ag --files-with-matches "$2" | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$2' {}"
fi

if [ "$1" = "-p" ] || [ "$1" = "--Plantnium" ]; then

  pt --files-with-matches $2 | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$2' {}"

fi
