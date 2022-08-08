#!/bin/bash
. workflowHandler.sh

# array of responses
responses=( 
			# postive responses 0-9
			"It is certain" 
			"It is decidedly so" 
			"Without a doubt" 
			"Yes definitely" 
			"You may rely on it" 
			"As I see it, yes" 
			"Most likely" 
			"Outlook good" 
			"Yes" 
			"Signs point to yes" 

			# shake again responses 10-14
			"Reply hazy try again" 
			"Ask again later" 
			"Better not tell you now" 
			"Cannot predict now" 
			"Concentrate and ask again" 

			# negative responses 15-19
			"Don't count on it" 
			"My reply is no" 
			"My sources say no" 
			"Outlook not so good" 
			"Very doubtful" 

			# any responses written below will be included with generic 
			# corresponding icon

			)

# produce random value corresponding to some response in the responses
randomValue=$(( RANDOM % ${#responses[@]} ))

if [ "$1" != "shake" ]; then
	addResult "${responses[$randomValue]}" "Magic 8 Ball" "Press enter to shake" "icon.png" "no" "shake"
	getXMLResults
fi

# use the random value to figure out which image to display
if [ $randomValue -lt 10 ]; then # good response
	addResult "${responses[$randomValue]}" "${responses[$randomValue]}" "Press enter to reshake" "img/yes.png" "no" "shake"

elif [ $randomValue -lt 15 ]; then # redo response
	addResult "${responses[$randomValue]}" "${responses[$randomValue]}" "Press enter to reshake" "img/maybe.png" "no" "shake"

elif [ $randomValue -lt 20 ]; then # bad response
	addResult "${responses[$randomValue]}" "${responses[$randomValue]}" "Press enter to reshake" "img/no.png" "no" "shake"

else # for any additional values added to the array
	addResult "${responses[$randomValue]}" "${responses[$randomValue]}" "Press enter to reshake" "icon.png" "no" "shake"

fi

getXMLResults # return XML to alfred

