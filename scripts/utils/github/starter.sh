#!/bin/bash
mv ~/GIT/current/epi_src/getlib/* .
mkdir src
echo "Commit name:"
read Name
git add .
git commit -m "♣️ First commit of $Name"
git push
echo "=============================="
echo "| git folder has been pushed |"
echo "=============================="
