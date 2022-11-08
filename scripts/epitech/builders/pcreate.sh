#!/bin/bash
echo "Name :"
read NAME
mkdir -p $NAME/src
cp -r ~/GIT/current/tech_src/getlib/* $NAME/
~/GIT/dotfile/scripts/epitech/builders/builderMain.sh
mv main.c $NAME/
