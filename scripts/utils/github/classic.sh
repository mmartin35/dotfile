#!/bin/bash

argsmod=$(git status | grep 'modified:' | sed 's/^.*: //' | tr -d '\n')
argsdel=$(git status | grep 'deleted:' | sed 's/^.*: //' | tr -d '\n')
argsadd=$(git status | grep -A1 '"git add <file>..." to include' | tail -1 | tr -d '\n')

echo "Advancement (..%):"
read advancement

#	TEST		#
if [ -n $argsmofidy ];then
	p_argsmod="| 🚀 Updated:$argsmod"
fi
if [ -n $advancement ];then
	p_advancement="| 🔋 Advancement: $advancement%"
fi
if [ -n $argsadd ];then
        git add *
	p_argsadd="| ✏ Added:$argsadd"
fi
if [ -n $argsdel ];then
	p_argsdel="| ✂ Deleted:$argsdel"
fi
git commit -m "$p_argsmod $p_advancement $p_argsadd $p_argsdel |"

echo "push now ? (yes/a)"
read temp
if [ -z $temp ];then
	echo "waiting to push..."
	exit 0
elif [ $temp == "yes" ];then
	git push
	echo "=============================="
	echo "| git folder has been pushed |"
	echo "=============================="
	exit 0
else
	echo "waiting to push..."
	exit 0
fi
