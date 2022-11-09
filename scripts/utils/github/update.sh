#!/bin/bash
args=echo (git status | grep 'modified:' | sed 's/^.*: //' | tr -d '\n')

git add .
git commit -m "updated: $args"
git push
echo "=============================="
echo "| git folder has been pushed |"
echo "=============================="
