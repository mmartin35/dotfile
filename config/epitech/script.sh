#!/bin/bash
if [ -z $1 ];then
	echo "no name specified"
	exit 0
else
	cp ~/GIT/config/config/epitech/header ./$1
	echo "build: done"
fi
