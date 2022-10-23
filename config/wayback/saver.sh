#!/bin/bash
server="user35p74a@31.37.54.74"

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
        echo "status: server push aborted"
fi

#	Copy to usb key		#
echo "Do you want to copy ressources into usb save device ?"
echo "Notice that you have to plug the right key. Press 'y' if you agree."
read answer
if [ $answer = 'y' ];then
	cp ~/GIT/dotfile/config/wayback/ressources/* /media/user/saves/ressources/
else
	echo "status: copy aborted"
fi

