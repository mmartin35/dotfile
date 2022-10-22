#!/bin/bash

##	Initialysing folders	##
echo "status: initialysing folders..."
mkdir -p ~/GIT/epitech ~/recovery ~/Code

echo "<----- folder creation done ----->"

##	Downloading packages	##
echo "status: downloading softwares..."
sudo apt update
sudo apt upgrade
sudo apt install snapd zsh gnome vlc virtualbox git neovim docker.io firefox
sudo snap install bitwarden electron-mail spotify typora discord

echo "<----- 1st step done ----->"

##	Recovering from server	##
echo "status: transfering backups..."
scp -r -P 4044 user35p74a@31.37.54.74:/home/pi/backup/like_new/ ~/recovery/

echo "<----- 2rd step done ----->"

##	Setting up github	##
echo "status: setting up git..."
echo "status: generating keygen for github..."
ssh-keygen 
git config --global user.email matthieu1.martin@epitech.eu


git clone git@github.com:mmartin35/dotfile.git -C ~/GIT/

echo "<----- 3rd step done ----->"

##	Setting up config	##
echo "status: setting up folders..."
cp /ressources/zshrc ~/.zshrc
cp ~/recovery/Documents/* ~/Documents/*
cp ~/recovery/Pictures/* ~/Pictures/*
cp ~/recovery/Code/* ~/Code/*
echo "status: setting up shell..."
chsh -s $(which zsh)

echo "<----- 4th step done ----->"

##	remove recovery		##
 rm -rf ~/recovery

echo "<----- 5th step done ----->"
