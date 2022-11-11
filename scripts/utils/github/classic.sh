#!/bin/bash
argsmod=$(git status | grep 'modified:' | sed 's/^.*: //' | tr -d '\n')
argsdel=$(git status | grep 'deleted:' | sed 's/^.*: //' | tr -d '\n')
echo "Advancement (..%):"
read advancement
git add .
git commit -m "🚀 Updated:$argsmod | 🔋 Advancement: $advancement% | ✂️ Deleted:$argsdel"
git push
echo "=============================="
echo "| git folder has been pushed |"
echo "=============================="
