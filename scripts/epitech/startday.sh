#!/bin/bash
if [ -z $1 ];then
	echo "Incomplete command"
	echo "format: startday [ day (number) ]"
	exit 0
fi
mkdir ~/GIT/epitech/day0$1
firefox github.com/ &
firefox outlook.office.com &
firefox intra.epitech.eu/user/#!/netsoul &
git clone git@github.com:EpitechPromo2027/B-CPE-100-NCY-1-1-cpoolday0$1-matthieu1.martin.git GIT/epitech/

