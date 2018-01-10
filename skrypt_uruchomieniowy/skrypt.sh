#!/bin/bash

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

function createLocalRepository(){
    clear
    mkdir -p ~/GitHUB/LocalRepository && git init ~/GitHUB/LocalRepository	
    dialog --msgbox "Repozytorium zostało utworzone w lokalizacji:\n ~/GitHUB/LocalRepository" 7 50
}

function gitConfiguration(){
    clear
    progressBar "Ładowanie usługi GitHub" 0.1
	
    clear
    >$O_STREAM
    dialog --title "Personalizacja konta GitHUB" --inputbox "Podaj swój e-mail: " 8 50 2>$O_STREAM
    email=$(<$O_STREAM)	
	
    clear
    >$O_STREAM
    dialog --title "Personalizacja konta GitHUB" --inputbox "Podaj wyświetlaną nazwę użytkownika konta GitHUB: " 8 50 2>$O_STREAM
    githubusername=$(<$O_STREAM)
        
    #ODKOMENTOWAC PONIŻSZE LINIE KODU
    #git config --global user.email "$email"
    #git config --global user.name "$githubusername" 

    #TWORZENIE PRZYKLADOWEGO REPOZYTORIUM LOKALNEGO
    
    clear
    #>$O_STREAM
    dialog --title "Tworzenie lokalnego repozytorium" --yesno "Czy chcesz teraz utworzyć repozytorium lokalne?" 8 50
    chosenOption=$?

    case $chosenOption in
    	0) createLocalRepository ;;
	*) clear; ;;
    esac
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
