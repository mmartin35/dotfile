#!/bin/bash
echo "Do you want to add lib to this folder ? y/n"
read ans
if [ $ans = 'y' ];then
	cp -r ~/GIT/epitech/ressources/* .
	echo "lib imported"
else
	echo "aborted"
fi
