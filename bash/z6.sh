#!/bin/bash

#pętla until

i=10

until [ ${i} -eq 10 ]; do
    echo ${i}
    i=$[i+1]
done


#pętla select
echo "Podaj opcję:"

select opcja in File Edit Quit
do
    case ${opcja} in
	"File") echo "Wybrano opcję ${opcja}" ;;
	"Edit") echo "Wybrano opcję ${opcja}" ;;
	"Quit") exit ;;
	*) echo "Error 404" ;;
    esac

done