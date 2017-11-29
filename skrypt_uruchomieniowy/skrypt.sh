#!/bin/bash

#Configuration

#Configuration of output stream
O_STREAM="/tmp/output.stream"

function getNameFromUser(){
	>$O_STREAM
	dialog --inputbox "Podaj swoje imię: " 8 50 2>$O_STREAM
	name=$(<$O_STREAM)
}

function chooseTheConfigurationOption(){
	>$O_STREAM
	dialog --title "Konfiguracja oprogramowania" --menu "Witaj $1!\nSkonfiguruj swoje oprogramowanie:" 15 50 5 \
		1 "Konfiguracja GitHub'a" \
		2 "Konfiguracja Bazy danych" \
		3 "Konfiguracja Serwera Apache" \
		4 "Node.js" \
		5 "Wybór IDE" 2>$O_STREAM
	chosenOption=$(<$O_STREAM)
}

function configuration(){
	getNameFromUser
	
	while [ true ] ; do
	clear
	chooseTheConfigurationOption $name

	case $chosenOption in
  		1) echo "GitHub" ;;
		2) echo "Baza danych" ;;
  		3) echo "Serwer Apache" ;;
		4) echo "Node.js" ;;
		5) echo "Wybór IDE" ;;
  		*) break 
	esac	
	done
}

configuration

rm $O_STREAM
clear
