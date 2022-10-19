#!/bin/bash
#	Saving config state	#
clear
echo "status: saving state of .zshrc, .vimrc..."
cp ~/.zshrc ~/GIT/dotfile/config/back_to_mine/ressources/zshrc
#	Server pull saver	#
scp -r 
