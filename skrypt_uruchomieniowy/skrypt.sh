#!/bin/bash

#Configuration

#Configuration of input stream
O_STREAM="/tmp/input.stream"
>$O_STREAM

#Powitanie
#dialog --title 'Konfigurator Środowiska Programisty Frontend' --msgbox 'Zaczynamy!' 5 80
dialog --inputbox "Podaj swoje imię: " 8 50 2>$O_STREAM

name=$(<$O_STREAM)

function configuration(){
	dialog --title "Konfiguracja oprogramowania" --menu "Witaj $name!\nSkonfiguruj swoje oprogramowanie:" 15 50 5 \
		1 "Konfiguracja GitHub'a" \
		2 "Konfiguracja Bazy danych" \
		3 "Konfiguracja Serwera Apache" \
		4 "Node.js" \
		5 "Wybór IDE"
}



configuration
#echo $userName

rm $O_STREAM
clear
