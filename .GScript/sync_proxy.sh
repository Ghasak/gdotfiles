#! /bin/bash

while [ : ]
do
        echo -n "[rsync] input machine [suggestion server1]: "
        read  input_1
        echo -n "[rsync] input workspace [suggestion DeepLearningAlgo]: "
        read workspace
        case $input_1 in
            server1)
                        rsync -auxv  --exclude 'notebook/*' --delete -e '/usr/bin/ssh' /Users/ghasak/Desktop/$workspace ghasak@$input_1:~/Desktop
                        echo "[+] rsync success $input_1"
                        break;;
            *)
                        echo "[!] input correct machine"
                        ;;
        esac
done
























































































