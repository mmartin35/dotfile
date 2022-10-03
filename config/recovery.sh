#!/bin/bash
## software dl
echo "status: downloading softwares..."
sudo snap install bitwarden electron-mail firefox spotify typora discord
sudo apt install snapd zsh gnome vlc virtualbox git neovim
clear
echo "######## (1) Done ########"
## updates
echo "status: updating..."
sudo apt upgrade
echo "######## (2) Done ########"
## folder dl
echo "status: transfering backups..."
scp -r -P 4044 user35p74a@user35p74a.ddns.net:/home/pi/backup/3/ /home/user/
echo "######## (3) Done ########"
## setting up in right folders
cp ~/config/files/.zshrc .
echo "status: installation complete"
