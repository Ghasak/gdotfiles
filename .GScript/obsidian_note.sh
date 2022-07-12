#!/usr/bin/env zsh
# MIT (c) Ghasak Ibrahim
set -Eeuo pipefail
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

# Requiremetns
# - [X] Fetch the directory when summon the obsidianNote
#   - Navigation
# - [X] Allow to create and delete a note while summon.
# - [X] Searching the notes for a specific file and lunch in Markdwon if possible

if [ -d $HOME/documents/myObsidianDoc ]; then
  cd $HOME/documents/myObsidianDoc
  echo "We are now at the note repo"
  ls -lahG
  read "KEYWORD1?- [?] Searching for a keyword? => "
  #read -p " do you like to search for a word "  KEYWORD1
  fif() {
    if [ ! "$#" -gt 0 ]; then
      echo "Need a string to search for!";
      return 1;
    fi
    rg --files-with-matches --no-messages "$KEYWORD1" | fzf --preview "rg --ignore-case --pretty --context 10 '$KEYWORD1' {}"
  }
  #KEYWORD1=${KEYWORD1:=word}
  output=$(fif $KEYWORD1)
  qlmanage -p $output
else
  echo "Obsidian is not installed on your system, no notes are available"
fi


