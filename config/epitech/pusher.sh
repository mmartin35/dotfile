echo "Write down your commit :"
read commit
git add .
git pull
git commit -m $commit
git push
echo "=============================="
echo "--git folder has been pushed--"
echo "=============================="
