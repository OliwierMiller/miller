#!/bin/bash

#definicja funkcji f1
function f1()  {
    echo -n "Podaj nazwę urzytkownika"
    read username
}

function f2()  {
    echo "{Username}"
}

function f3()  {
    echo "f3"
}

#menu skryptu
select opcja in f1 f2 f3 Quit
do
    case ${opcja} in
	"f1") f1 ;; 
	"f2") f2 ;;
	"f3") f3 ;;
	"Quit") exit 0;;
	*) echo "Podaj opcję z menu."
    esac
done