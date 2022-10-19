#!/bin/bash

##	Downloading packages	##
echo "status: downloading softwares..."
sudo apt update
sudo apt upgrade
sudo apt install snapd zsh gnome vlc virtualbox git neovim docker.io firefox
sudo snap install bitwarden electron-mail spotify typora discord
echo "<----- 1st step done ----->"

##	Recovering from server	##
echo "status: transfering backups..."
mkdir -p ~/recovery
scp -r -P 4044 user35p74a@user35p74a.ddns.net:/home/pi/backup/full/ ~/recovery/
echo "<----- 2rd step done ----->"

##	Setting up folders	##
echo "status: setting up folders..."
mkdir -p ~/GIT/epitech ~/Code/languages
cp -r /ressources/ssh ~/.ssh
cp /ressources/zshrc ~/.zshrc
git clone git@github.com:mmartin35/dotfile.git -C ~/GIT/
cp ~/recovery/Documents/* ~/Documents/*

# remove recovery folder after done
echo "<----- 3rd step done ----->"
