#!/bin/bash
argsmod=$(git status | grep 'modified:' | sed 's/^.*: //' | tr -d '\n')
argsdel=$(git status | grep 'deleted:' | sed 's/^.*: //' | tr -d '\n')
argsadd=$(git status | grep -A1 "git add <file>" | tail -1)
echo "Advancement (..%):"
read advancement
git add *
if [ -z $argsdel ];then
	if [ -z $advancement ];then
		git commit -m "🚀 Updated:$argsmod"
	else
		git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement%"
	fi
	git commit -m "🚀 Updated:$argsmod | ✂ Deleted:$argsdel"
else
	if [ -z $advancement ];then
		git commit -m "🚀 Updated:$argsmod | ✂ Deleted:$argsdel"
	else
		git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement% | ✂️ Deleted:$argsdel"
	fi
fi
git push
echo "=============================="
echo "| git folder has been pushed |"
echo "=============================="
echo "$argsadd"
