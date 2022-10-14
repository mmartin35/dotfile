#!/bin/bash
echo "Which day is it ?" 
read day
if [ $day < 10 ];then
	firefox https://github.com/EpitechPromo2027/B-CPE-100-NCY-1-1-cpoolday0$day-matthieu1.martin &
	firefox https://intra.epitech.eu/module/2022/B-CPE-100/NCY-1-1/#!/all/TP-$day-C-Pool-Day-0$day &
	firefox https://outlook.office365.com/mail/ &
else
	firefox https://github.com/EpitechPromo2027/B-CPE-100-NCY-1-1-cpoolday$day-matthieu1.martin &
        firefox https://intra.epitech.eu/module/2022/B-CPE-100/NCY-1-1/#!/all/TP-$day-C-Pool-Day-$day &
        firefox https://outlook.office365.com/mail/ &
fi
clear
echo "Do you want to clone the repo ? (y/n)"
read ans
if [ $ans = "y" ];then
	if [ $day < 10 ];then
		git clone git@github.com:EpitechPromo2027/B-CPE-100-NCY-1-1-cpoolday0$day-matthieu1.martin.git
		mv B-CPE* ~/GIT/epitech/day$day
	else
		git clone git@github.com:EpitechPromo2027/B-CPE-100-NCY-1-1-cpoolday$day-matthieu1.martin.git
                mv B-CPE* ~/GIT/epitech/day$day
	fi
else
	echo "Repo not cloned"
fi
clear
