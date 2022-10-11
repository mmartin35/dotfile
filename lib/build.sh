#!/bin/bash
echo "Build lib c int directory ? yes/no"
read yesno
if [ $yesno = 'yes' ];then
	mkdir -p lib/my/
	gcc -c ~/GIT/epitech/lib/*.c
	mv ~/GIT/epitech/lib/.a.out libmy.a
	echo "done"
elif [ $yesno = 'no' ];then
	echo "aborted"
else 
	echo "wrong argument"
fi
