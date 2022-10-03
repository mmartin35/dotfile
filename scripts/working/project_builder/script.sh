#!/bin/bash 
# RETURN 0 #
if [ -z $1 ];then
	cat ~/Code/Dotfile/scripts/on_it/project_builder/resources/index.txt
	exit 0
elif [ $1 = "-h" ];then
        cat ~/Code/Dotfile/scripts/on_it/project_builder/resources/help.txt
        exit 0 
elif [ $1 = "-l" ];then
        ls ~/Code/Dotfile/scripts/on_it/project_builder/resources/
        exit 0
fi
# RETURN #
if [ $1 = "-c" ] && [ -n $2 ];then ## classic file with basics
        mkdir $2 $2/resources/
        touch $2/script
        cp ~/Code/Dotfile/scripts/on_it/project_builder/resources/headers/index.txt $2/resources/index.txt
	cp ~/Code/Dotfile/scripts/on_it/project_builder/resources/headers/help.txt $2/resources/help.txt
elif [ $1 = "-s" ] && [ -n $2 ] && [ -n $3 ];then ## about used language 
        mkdir $3 $3/resources/
        touch $3/script.$2
        cp ~/Code/Dotfile/scripts/on_it/project_builder/resources/headers/index.txt $3/resources/index.txt
	cp ~/Code/Dotfile/scripts/on_it/project_builder/resources/headers/help.txt $3/resources/help.txt
        cp ~/Code/Dotfile/scripts/on_it/project_builder/resources/headers/$2 $3/script.$2
        if [ $2 = "sh" ];then
                chmod +x $3/script.sh
        else
		echo "status: language pattern not found"
	fi
else
        echo "status: missing value"
        echo "check server -h to get help"
fi
