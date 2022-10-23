#!/bin/bash
server="user35p74a@31.37.54.74"
media="/media/user/saves"
reter="echo 'status: aborted'"

#	Saving config state	#
clear
echo "status: saving state of .zshrc, .vimrc..."
cp ~/.zshrc ~/GIT/dotfile/config/wayback/ressources/zshrc

#	Server pull saver	#
echo " Do you want to push main folders on the server ?"
read answer
if [ $answer = 'y' ];then
	scp -r -P 4044 ~/Documents/light/* $server:/home/pi/backup/wayback/Documents
	scp -r -P 4044 ~/Pictures/* $server:/home/pi/backup/wayback/Pictures        
	scp -r -P 4044 ~/Code/* $server:/home/pi/backup/wayback/Code
else    
	$reter
fi

#	Copy to usb key		#
echo "Do you want to copy ressources into pre-configured usb device ? (y/abort)"
read answer
if [ $answer = 'y' ];then
	cp ~/GIT/dotfile/config/wayback/ressources/* $media/ressources/
else
	$reter
fi
