#!/bin/bash
media="/media/user/saves"
server="user35p74a@31.37.54.74"
serverpath="~/backup/wayback"
port="-P 4044"
reter="echo status: aborted"

#	Saving config state	#
clear
echo "status: saving state of .zshrc, .vimrc..."
cp ~/.zshrc ~/GIT/dotfile/config/wayback/ressources/zshrc
cp ~/.config/i3/* ~/GIT/dotfile/config/wayback/ressources/GUI/i3
cp ~/.config/i3status/* ~/GIT/dotfile/config/wayback/ressources/GUI/i3status

#	Server pull saver	#
echo "Do you want to push main folders on the server ?"
read answer
if [ $answer = 'y' ];then
	scp -r $port ~/Documents/light/* $server:$serverpath/Documents
	scp -r $port  ~/Pictures/* $server:$serverpath/Pictures
	scp -r $port  ~/Code/* $server:$serverpath/Code
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
