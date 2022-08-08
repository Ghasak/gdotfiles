#!/usr/bin/env bash
########################################################################
#                         DEEP SERACH II
########################################################################
# Author: 	Paul Weibert ( paul.weibert@gmail.com )
# Version: 	0.2
# Date: 	24.6.2012
# Description:  Searches multiple PDF files,
#		takes the folder-path and the query-string as parameter.
# Dependencies: grep, bash , pdftotext
########################################################################
# Reference:
# https://stackoverflow.com/questions/4643438/how-to-search-contents-of-multiple-pdf-files


query=;
searchpath=./;


# Printing usage-information #
##############################
printError(){
echo "Searches all PDF-files in the specified folder for specified query."
echo "usage: pdfsearch -p <pdf-file-folder> -q <term>"
echo ""
echo "-h --help 	Print help"
echo "-p 		Directory containing all pdf-files you want to be searched."
echo "-q 		Specified query-term you want find."
echo ""
}


# read parameters #
###################
if [ -n "$1" ]; then
  while [ "$1" ]; do

	if [ "$1" = "-h" -o "$1" = "--help" ]; then printError; exit 2; fi

	if [ "$1" = "-p" ]; then
		if [ -n "$2" ]; then searchpath="$2";
		shift;
		else printError; exit 2;
		fi
	fi

	if [ "$1" = "-q" ]; then
		if [ -n "$2" ]; then query="$2";
		shift;
		else printError; exit 2;
		fi
	fi


	shift
  done
else printError; exit 2
fi
if [ ! -n $query ];
then
	echo;
	echo "No query-term specified!";
	printError;
	exit 2;
fi


# PDF-search #
##############
find "$searchpath" -name '*.pdf' -exec bash -c ' var=$(pdftotext -q "{}" - ); match=$( echo $var | grep -i $1 );  if [ "$match" ]; then echo "{}" ; fi ; ' _ "$query" \;
