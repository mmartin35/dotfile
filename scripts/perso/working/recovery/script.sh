#!/bin/bash 

# RETURN 0 #
clear
if [ -z $1 ];then
	cat ~/Code/Dotfile/scripts/on_it/recovery/resources/index.txt
	exit 0
elif [ $1 = "-h" ];then 
	cat ~/Code/Dotfile/scripts/on_it/recovery/resources/help.txt
	exit 0
fi
# RETURN #
if [ $1 = "-set" ];then
	echo "Which kind of recovery do you want ? (minimal/medium/complete)"
	read type
	~/Code/Dotfile/scripts/on_it/recovery/types/$type.sh
fi
