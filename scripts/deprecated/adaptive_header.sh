#!/bin/bash
today=$(date +%d/%m/%Y)
time=$(date +"%T")
div=/*
div2=*/
email=example@address.mail

_select_title() {
    printf "Write down the title of your project: " ; read -r title
    title=${title// /_}
    title=${title,,}
    [ "${title: -3}" != '.c' ] && title=${title}.c
    if [ -e $title ] ; then 
        printf "\n%s\n%s\n\n" "The script \"$title\" already exists." \
        "Choose another name."
        _select_title
    fi
}

_append_file() {
	printf "%s\n" "${div}" > $title
	printf "%-19s%-0s\n" "** Title:" "$title" >> $title
	printf "%-19s%-0s\n" "** Made by:" "$email" >> $title
	printf "%-0s\n" "** <----------------------------------->" >> $title
	printf "%-19s%-0s\n" "** Creation date:" "$today at $time" >> $title
	printf "%-19s%-0s\n" "** Note:" >> $title
	printf "%s" "${div2}" >> $title
}
_select_title
_append_file

/usr/bin/clear
