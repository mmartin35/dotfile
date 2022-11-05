#!/bin/bash
read NAME
git init $NAME
hub create
gh auth login
gh repo create $NAME --private --source=. --remote=upstream --push
git push
echo "=============================="
echo "| git folder has been created |"
echo "=============================="
