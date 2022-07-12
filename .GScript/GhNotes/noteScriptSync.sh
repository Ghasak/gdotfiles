#!/bin/bash

if (ps aux | grep "Mweb")
then
        echo "It is Running"
        echo "Now I will close it"
        osascript -e 'quit app "Mweb"'
        INPUT_SOURCE_NAME=$1
        EXPORT_PDF_NAME=$2
        EXTENSION_VAR=".md"
        EXPORT_EXTENSION_VAR=".pdf"
        #echo "${1%/}"
        VAR1=$(echo "${1}${EXTENSION_VAR}")
        VAR2=$(echo "${1}${EXPORT_EXTENSION_VAR}")
        #echo "$INPUT_SOURCE_NAME and $EXPORT_PDF_NAME"
        pandoc -f markdown $VAR1 -o $VAR2 && qlmanage -p $VAR2
        #echo "$INPUT_SOURCE_NAME Exported Successfully!!"
else
        echo "It is stopped"
fi






