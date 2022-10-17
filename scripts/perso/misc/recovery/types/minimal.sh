#!/bin/bash
## software dl
sudo snap install firefox spotify
sudo apt install zsh gnome git
clear
echo "######## (1) Done ########"
## updates
echo "status: skipping updates, make it by yourself"
echo "######## (2) Done ########"
## folder dl
scp -r -P 4044 user35p74a@user35p74a.ddns.net:/home/pi/backup/1 /home/user/
echo "######## (3) Done ########"
## setting up in the right folder
cp ~/config/files/.zshrc .
echo "######## (4) Done ########"
echo "status: installation complete"
