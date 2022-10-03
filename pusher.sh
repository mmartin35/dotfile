# return 0
if [ -z $1 ];then 
	echo "no commit message"
	exit 0
fi
if [ $1 == "EasterEgg" ];then 
	echo "In progress... Go on pastebin.com/testeurs"
fi
# return 
echo "Do you want to push ? "
read ans
if [ $ans == "y" ];then
	git add .
	git pull
	git commit -m "$1"
	git push
else 
	echo "error"
	exit 0 
fi
