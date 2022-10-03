#!/bin/bash
## software dl
clear
echo "install: Do you want to download softwares ? (yes/no)"
read awn
if [ $awn = 'yes' ] || [ $awn = "y" ];then
	sudo snap install electron-mail firefox spotify typora discord 
	sudo apt install zsh gnome vlc virtualbox git
elif [ $awn = 'no' ] || [ $awn = "n" ];then
        echo "status: download skipped" 
else
        echo "status: aborted"
        exit 0
fi
echo "######## (1) Done ########"
## updates
echo "status: Do you want to update everything ? (yes/no)"
read awn
if [ $awn = 'yes' ] || [ $awn = "y" ];then
        sudo apt upgrade
elif [ $awn = 'no' ] || [ $awn = "n" ];then 
        echo "status: update skipped"
else
        echo "status: aborted"
        exit 0
fi
echo "######## (2) Done ########"
## folder dl
echo "status: Do you want to transfer backups ? (yes/no)"  
read awn
if [ $awn = 'yes' ] || [ $awn = "y" ];then
	scp -r -P 4044 user35p74a@user35p74a.ddns.net:/home/pi/backup/2 /home/user/
	echo "status: Do you want to set your folders properly ? (yes/no)"
	read awn 
	if [ $awn = 'yes' ] || [ $awn = "y" ];then
        	cp ~/config/files/.zshrc .
	elif [ $awn = 'no' ] || [ $awn = "n" ];then
        	echo "status: transfer skipped"      
	else
        	echo "status: aborted" 
        	exit 0
	fi
elif [ $awn = 'no' ] || [ $awn = "n" ];then
        echo "status: transfer skipped"      
else
        echo "status: aborted" 
        exit 0
fi
echo "######## (3) Done ########"
echo "status: installation complete" 
