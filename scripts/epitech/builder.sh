#!/bin/bash
today=$(date +%d/%m/%Y)
div=/*******************************************
div2=*******************************************/

/usr/bin/clear

_select_title(){

    # Get the user input.
    printf "name: " ; read -r title

    # Remove the spaces from the title if necessary.
    title=${title// /_}

    # Convert uppercase to lowercase.
    title=${title,,}

    # Add .c to the end of the title if it is not there already.
    [ "${title: -3}" != '.c' ] && title=${title}.c

    # Check to see if the file exists already.
    if [ -e $title ] ; then 
        printf "\n%s\n%s\n\n" "The script \"$title\" already exists." \
        "Please put another name."
        _select_title
    fi

}

_select_title

# Format the output and write it to a file.
printf "%-16s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%s\n\n\n" \
"${div}" '**title' ":$title" '**description' \
":EPITECH, promo 2022" '**author' ":matthieu1.martin@epitech.eu" '**date' ":$today" \
"${div2}" > $title

/usr/bin/clear
