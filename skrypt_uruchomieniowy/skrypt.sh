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

function progressBar(){
	for i in $(seq 0 10 100) ; do sleep $2; echo $i | dialog --gauge "$1..." 7 50 0; done
}

function gitConfiguration(){
	clear
	progressBar "Ładowanie usługi GitHub" 0.1

	#USTAWIENIA IDENTYFIKACJI UZYTKOWNIKA
	#email
	#git config --global user.email "email@example.com"

	#nazwa uzytkownika
	#git config --global user.name "user name" 

	#TWORZENIE PRZYKLADOWEGO REPOZYTORIUM LOKALNEGO
}

function databaseConfiguration(){
	clear
	progressBar "Ładowanie usług bazy danych" 0.1

	#TWORZENIE NOWEGO UZYTKOWNIKA BAZY DANYCH
}

function apacheConfiguration(){
	clear
	progressBar "Ładowanie usług serwera Apache" 0.1
}

function nodejsConfiguration(){
	clear
	progressBar "Ładowanie usług Node.js" 0.1
}

function ideChoice(){
	clear
	progressBar "Ładowanie okna wyboru środowiska programistycznego" 0.2
}


function configuration(){
	getNameFromUser
	
	while [ true ] ; do
	clear
	chooseTheConfigurationOption $name

	case $chosenOption in
  		1) gitConfiguration ;;
		2) databaseConfiguration ;;
  		3) apacheConfiguration ;;
		4) nodejsConfiguration ;;
		5) ideChoice ;;
  		*) clear; break ;;
	esac	
	done
}

configuration

rm $O_STREAM
clear
