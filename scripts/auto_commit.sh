#!/bin/bash
/bin/clear

_get_git_status() {
	modified=$(git status | grep -A1 'modified:' | sed 's/^.*: //' | tr -d '\n')
	deleted=$(git status | grep -A1 'deleted:' | sed 's/^.*: //' | tr -d '\n')
	added=$(git status | grep -A1 '"git add <file>..." to include' | tail -1 | tr -d '\n'| sed -e 's/^[ \t]*//')
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
	if [[ -n $modified ]];then
		update_to="[U] $modified "
	fi
	if [[ -n $added ]];then
        	git add *
		add_to="[A] $added "
	fi
	if [[ -n $deleted ]];then
		git add *
		del_to="[R] $deleted "
	fi
}
_get_branch() {
	while [[ -z $branch_name ]]
	do
		echo "which branch to push ? (default branch: main)"
		read branch_name
		if [[ -z $branch_name ]];then
			branch_name="main"
		fi
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
