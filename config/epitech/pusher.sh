echo "Write down your commit :"
read commit
git add .
git pull
git commit -m $commit
git push
echo "git pushed successfully"
