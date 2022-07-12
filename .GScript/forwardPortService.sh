!# bin/bash

echo "Do you like to run jupyter from the server: [YES/NO] "
read ANSWER
CHOICE1=$( echo "$ANSWER" | tr '[a-z]' '[A-Z]' )
echo "You input this : $CHOICE1!! right"

if [ $CHOICE1 == "YES" ] || [ $CHOICE1 == "Y" ];
then
        echo "Which Server you want to run (e.g., myServer)"
        read CHOICE2

        if [ $CHOICE2 == "myServer" ]

        then
                echo "There is a server with this name:  $CHOICE2"
                echo "On which port !! (e.g., 1234)"
                read PORTNUMBER
                # Check if the input is a digit number
                if ! [[ "$PORTNUMBER" =~ ^[0-9]+$ ]] ;
                then
                        exec >&2; echo "Error: Not a port number"; exit 1
                else
                        sleep 1 && open -a safari http://localhost:$PORTNUMBER
                        echo "Now the server is running!"
                        ssh $CHOICE2 -NL $PORTNUMBER:localhost:$PORTNUMBER
                fi

        else
                echo "There is no such server please try again later ..!!!"
        fi
fi



for (( i = 0; i < 10; i++ )); do
  for (( j = 0; i < 10; i++ )); do
    for (( k = 0; i < 10; i++ )); do
      echo "$i, $j, $k"

    done
  done
done











