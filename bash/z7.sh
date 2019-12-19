#!/bin/bash

#Funkcje, podprogramy
#procedura
function Moja ()  {
    echo "Procedura"
}

#wywołanie procedury


#Zad1 wywołaj procedurę 10 razy metodą iteracyjną (while)

Moja

x=1
while [ $x -le 10 ]; do
    Moja
x=$[x + 1]
done


#wyrażenia arytmetyczne
echo $((2+2))

echo $[2+2]


x=5
y=2

let suma=${x}+${y}
echo ${suma}

#operatory arytmetyczne
# + : dodawanie
# - : odejmowanie
# * : mnożenie
# / : dzielenie
# % : reszta z dzielenia

echo $[x%y]

















