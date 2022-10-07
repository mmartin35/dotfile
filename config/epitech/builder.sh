#!/bin/bash
if [ -z $1 ];then
	echo "no name specified"
	exit 0
else
	cp ~/GIT/dotfile/config/epitech/header ./$1.c
	echo "build: done"
fi
