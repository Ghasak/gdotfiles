#!/bin/bash

if (ps aux | grep "Mweb")
then
        echo "It is Running"
        echo "Now I will close it"
        osascript -e 'quit app "Mweb"'
else
        echo "It is stopped"
fi






