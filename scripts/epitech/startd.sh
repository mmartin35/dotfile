#!/bin/bash
echo "Which day is it ?" 
read day
firefox https://github.com/EpitechPromo2027/B-CPE-100-NCY-1-1-cpoolday0$day-matthieu1.martin &
firefox https://intra.epitech.eu/module/2022/B-CPE-100/NCY-1-1/#!/all/TP-$day-C-Pool-Day-0$day &
firefox https://outlook.office365.com/mail/ &
echo "Do you want to clone the repo ? (y/n)"
read ans
if [ $ans = "y" ];then
	git clone git@github.com:EpitechPromo2027/B-CPE-100-NCY-1-1-cpoolday0$day-matthieu1.martin.git
	mv B-CPE* ~/GIT/epitech/day$day
else
	echo "Repo not cloned"
fi
