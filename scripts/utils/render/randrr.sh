#!/bin/bash
if [ -z $1 ] || [ $1 == "-h" ];then
	echo "USAGE                                                    "
	echo "      command format: randrr [option] [output] [position]"
	echo "OPTIONS                                                  "
	echo "      0. go to script file                               "
	echo "      1. reset to main position (single display)         "
	echo "      2. set output and position                         "
	echo "      3. not setup yet                                   "
	exit 0
fi
if [ $1 == "0" ];then
	nvim ~/GIT/dotfile/scripts/utils/render/randrr.sh
	exit 0
elif [ $1 == "1" ];then
	xrandr --auto --output eDP-1 --mode 1920x1080
	echo "status: position reset"
	exit 0
elif [ $1 == "2" ];then
	if [ -z $2 ] || [ -z $3 ];then
		echo "status: wrong number of argument"
		exit 1
	else
        	xrandr --auto --output eDP-1 --mode 1920x1080 --$3-of $2
		echo "status: position set"
		exit 0
	fi
elif [ $1 == "3" ];then
	echo "status: not setup yet"
else
	echo "error"
	exit 1
fi
exit 0;
