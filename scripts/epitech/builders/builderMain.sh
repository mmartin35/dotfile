#!/bin/bash
today=$(date +%d/%m/%Y)
time=$(date +"%T")
div=/*
div2=*/
email=matthieu1.martin@epitech.eu
title=main.c

# Format the output.
printf "%-2s\n\
%-19s%-0s\n\
%-19s%-0s\n\
%-19s%-0s\n\
%-19s%-0s\n\
%-19s%-0s\n\
%-19s%-0s\n\
%s\n" \
"${div}" '** Language' ': C' '** Title' ": $title" '** File description:' \
"" "** <------------------------------------------->" '' '** Made by' ": $email" '** Creation date' ": $today at $time" \
"${div2}" > $title
