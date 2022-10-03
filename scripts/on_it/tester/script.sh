#!/bin/bash 
clear
# RETURN 0 # 
if [ $1 = '-h' ];then
        cat ~/Code/Dotfile/Linux/scripts/in_progress/.../resources/help_page.txt
        exit 0
fi
# RETURN #
# Dl of packages
echo 'Step 1...'
echo 'You need to install 3 packages, do you want to do so ?'
read awn
if [ $awn = "yes" ] || [ $awn = "y" ];then
	echo 'Step 1...'
	sudo apt install iw hostapd udhcpd
	echo 'Done'
elif [ $awn = 'no' ] || [ $awn = 'n' ];then 
	echo 'Skipped'
fi
# Check interface compatibility
iw list | grep -i "* AP" -m 1 >> temp
md5sum temp | sed -nr '1s/^([^ ]+).*/\1/p' >> hashed
rm temp
if [ hashed == "67a5296853885eeeaa26b29c2a70b99e" ];then
	echo 'Step 2...'
	sudo iw phy phy0 interface add new1 type __ap
	echo 'Done'
	rm hashed
else
	cat hashed
	echo 'Aborted: Internal error'
fi
echo 'Done'
rm hashed
