#!/bin/bash
argsmod=$(git status | grep 'modified:' | sed 's/^.*: //' | tr -d '\n')
argsdel=$(git status | grep 'deleted:' | sed 's/^.*: //' | tr -d '\n')
argsadd=$(git status | grep -A1 "git add <file>" | tail -1 | tr -d '\n')
echo "Advancement (..%):"
read advancement
git add *
if [ -z $argsadd ];then
	argsadded=""
else
	argsadded="| ✏️ Added:$argsadd"
fi
if [ -z $argsdel ];then
	if [ -z $advancement ];then
		git commit -m "🚀 Updated:$argsmod $argsadded"
	else
		git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement% $argsadded"
	fi
else
	if [ -z $advancement ];then
		git commit -m "🚀 Updated:$argsmod | ✂ Deleted:$argsdel $argsadded"
	else
		git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement% | ✂️ Deleted:$argsdel $argsadded"
	fi
fi
git push
echo "=============================="
echo "| git folder has been pushed |"
echo "=============================="
