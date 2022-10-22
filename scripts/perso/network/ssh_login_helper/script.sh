#!/bin/bash
# NO RETURN 1 #
if [ -z $1 ];then
        cat ~/Code/Dotfile/Linux/scripts/in_progress/ssh_login_helper/resources/index.txt
        exit 0
elif [ $1 = "-h" ];then
        cat ~/Code/Dotfile/Linux/scripts/in_progress/ssh_login_helper/resources/help_page.txt
        exit 0
elif [ $1 = "-l" ];then  
        cat ~/Code/Dotfile/Linux/scripts/in_progress/ssh_login_helper/resources/list.txt
        exit 0
elif [ $1 = "-la" ];then ## add server users
        printf "$2 \n" >> ~/Code/Dotfile/Linux/scripts/in_progress/ssh_login_helper/resources/list.txt
        echo "status: user added"
	exit 0
elif [ $1 = "-lr" ];then ## erase server logins  
        rm ~/Code/Dotfile/Linux/scripts/in_progress/ssh_login_helper/resources/list.txt
        touch ~/Code/Dotfile/Linux/scripts/in_progress/ssh_login_helper/resources/list.txt
        echo "status: list cleared" 
        exit 0
fi
# RETURN #
if [ $1 = "-f" ];then ## fast login
	clear
        ssh user35p74a@31.37.54.74 -p 4044
elif [$1 = "-c" ] && [ -z $2 ];then ## connect to server
	clear
        echo "server: trying to connect to $2..." 
        ssh $2@31.37.54.74 -p 4044
else 
	echo "status: missing value"
	echo "check server -h to get help"
fi
