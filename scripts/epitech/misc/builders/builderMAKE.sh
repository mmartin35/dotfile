#!/bin/bash
today=$(date +%d/%m/%Y)
time=$(date +"%T")
title="Makefile"
div=##
div2=##

/usr/bin/clear

# Format the output.
printf "%-2s\n\
%-0s%-0s\n\
%-0s%-0s\n\
%-19s%-0s\n\
%-19s%-0s\n\
%-19s%-0s\n\
%-19s%-0s\n\
%s\n" \
"${div}" "## EPITECH PROJECT, 2022" '' '## Title' ": $title" '## File description:' \
"" "## <------------------------------------------->" '' '## Made by' ": matthieu1.martin@epitech.eu" '## Creation date' ": $today at $time" \
"${div2}" > $title

/usr/bin/clear
