#!/bin/bash


#zmienna globalne
#ładowanie danych z pliku
user_list=(`cat users.txt`)
status="FAIL"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\e[0m'

function checkStatusCode() {
    if [ $? == 0 ]; then
	status="${GREEN}[PASS]${NC}"
    else
	status="${RED}[FAIL]${NC}"
    fi

}

function showUsers() {
    echo -e "${BWhite}Load Users ...${NC}"
    echo "Lista:"
    for (( i=0; i<=${#user_list[@]}; i++ ))
    do
	echo "	${user_list[i]}"
    done

}

function addUsers() {
    echo "addUsers ..."
    echo -n "Are you sure? [y/n]"
    read sure
    if [ "${sure}" == "y" ]; then
	for user in "${user_list[@]}" 
	do
	    sudo useradd ${user} -m -s /sbin/nologin -g "users" 2> /dev/null
	    checkStatusCode
	    #echo "Add user: ${user} [${status}]"
	    printf "Add user %10b %20b\n" "${user}" "[${status}]"
	done
    fi
}

function delUsers() {
    echo "delUsers ..."
    echo -n "Are you sure? [y/n]"
    read sure
    if [ "${sure}" == "y" ]; then
	for user in "${user_list[@]}"
	do
	    sudo userdel -r ${user} 2> /dev/null
	    checkStatusCode
	    #echo -e "Remove user ${user} ${status}"
	    printf "Remove user %10b %20b\n" "${user}" "[${status}]"
	done
    fi
}

function acceptRemoteLogin() {
    echo "acceptRemotelogin"
    for user in "${user_list[@]}"
    do
	sudo usermod -s /bin/bash ${user} 2> /dev/null
	checkStatusCode
	#echo -e "Accept remote login for ${user} ${status}"
	printf "Denied remote login for %10b %20b\n" "${user}" "${status}"
    done
}

function deniedRemoteLogin() {
    echo "deniedRemoteLogin ..."
    for user in "${user_list[@]}"
    do
	sudo usermod -s /sbin/nologin ${user} 2> /dev/null
	checkStatusCode
	#echo -e "Denied remote login for ${user} ${status}"
	printf "Denied remote login for %10b %20b\n" "${user}" "[${status}]"
    done
}

function quit() {
    exit 0
}

function help() {
cat << EndOfMessage
    Opis opcji skryptu:
    ------------------
    LU -> Listowanie użytkowników z pliku
    AU -> Dodawanie użytkowników
EndOfMessage
}

#menu

select option in HELP SU AU DU ARL DRL QUIT
do
    case ${option} in
	"SU") showUsers ;;
	"AU") addUsers ;;
	"DU") delUsers ;;
	"ARL") acceptRemoteLogin ;;
	"DRL") deniedRemoteLogin ;;
	"HELP") help ;;
	"QUIT") quit;;
	 *)help
    esac
done
