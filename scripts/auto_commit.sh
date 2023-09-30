#!/bin/bash
/bin/clear

_get_git_status() {
	argsmod=$(git status | grep -A1 'modified:' | sed 's/^.*: //' | tr -d '\n')
	argsdel=$(git status | grep -A1 'deleted:' | sed 's/^.*: //' | tr -d '\n')
	argsadd=$(git status | grep -A1 '"git add <file>..." to include' | tail -1 | tr -d '\n'| sed -e 's/^[ \t]*//')
}
_insert_comment() {
	echo "Write down the commit"
	read comment
	if [[ -z $comment ]];then
		_insert_comment
	else
		comment_to="[C] $comment "
	fi
}
_check_empty_args() {
if [ -n $argsmofidy ];then
	update_to="[U] $argsmod "
fi

if [ -n $argsadd ];then
        git add .
	add_to="[A] $argsadd "
fi

if [ -n $argsdel ];then
	git add .
	del_to="[R] $argsdel "
fi
}
_get_branch() {
while [ -z $branch_name ]
do
	echo "which branch to push ?"
	read branch_name
done
}
_format_and_push() {
	git commit -m "$comment_to -> $update_to $add_to $del_to"
	git push -u origin $branch_name
	echo "git commit has been pushed"
}
echo "Push the current repository on github ? (y/a)"
read status
if [ -z $status ];then
	echo "aborted"
	exit 84
fi
if [ $status == "y" ];then
	_get_git_status
	_insert_comment
	_check_empty_args
	_get_branch
	_format_and_push
	exit 0
else
	echo "aborted"
	exit 84
fi
