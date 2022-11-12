#!/bin/bash
argsmodify=$(git status | grep 'modified:' | sed 's/^.*: //' | tr -d '\n')
argsdel=$(git status | grep 'deleted:' | sed 's/^.*: //' | tr -d '\n')
argsadd=$(git status | grep -A1 "git add <file>" | tail -1 | tr -d '\n')
echo "Advancement (..%):"
read advancement
git add *

#	Modifier	#
if [ -z $argsmodify ];then
	argsmod=" x "
else
	argsmod=$argsmodify
fi

#	Infos format	#
if [ -z $argsadd ];then
	if [ -z $argsdel ];then
		if [ -z $advancement ];then
                	git commit -m "🚀 Updated:$argsmod"
        	else
                	git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement%"
        	fi
	else
        	if [ -z $advancement ];then
               		git commit -m "🚀 Updated:$argsmod | ✂ Deleted:$argsdel"
        	else
                	git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement% | ✂ Deleted:$argsdel"
        	fi
	fi
else
	if [ -z $argsdel ];then
        	if [ -z $advancement ];then
                	git commit -m "🚀 Updated:$argsmod | ✏️ Added:$argsadd"
        	else
                	git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement% | ✏ Added:$argsadd"
        	fi
	else
        	if [ -z $advancement ];then
                	git commit -m "🚀 Updated:$argsmod | ✂ Deleted:$argsdel | ✏ Added:$argsadd"
        	else
                	git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement% | ✂ Deleted:$argsdel | ✏ Added:$argsadd"
        	fi
	fi
fi
echo "push now ?"
read push
if [ $push == "y" ];then
	git push
	echo "=============================="
	echo "| git folder has been pushed |"
	echo "=============================="
else
	echo "waiting to push..."
fi
