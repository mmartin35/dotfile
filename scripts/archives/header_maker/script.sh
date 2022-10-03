#!/bin/sh

# Check if empty 
if [ -z $1 ];then
       echo "No argument, use -h for help." 
       exit 0
fi

# Options
if [ $1 = "-h" ];then
        cat ~/Documents/Works/3.config/Linux/scripts/header_maker/man/help_page
        exit 0 
elif [ $1 = "-l" ];then
	ls ~/Documents/Works/3.config/Linux/scripts/header_maker/headers
        exit 0
fi

# Code
if [ -z $1 ];then 
	echo "header: missing operand" 
	exit 0 
fi
if [ $1 = "sh" ] || [ $1 = "html" ] || [ $1 = "c" ];then 
	echo "header: creating file..."
else 
	echo "header: language not supported"
	exit 0
fi
if [ -z $2 ];then
	cp ~/Documents/Works/3.config/Linux/scripts/header_maker/headers/$1 test.$1
else 
	cp ~/Documents/Works/3.config/Linux/scripts/header_maker/headers/$1 $2.$1
fi
