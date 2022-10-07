echo "Write down your commit :"
read commit
git add .
git pull
git commit -m $commit
git push
clear
echo "git pushed successfully"
