#!/bin/bash
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
cd projects
find . -name '.DS_Store' -type f -delete
cd ../

./packages.sh
dpkg-scanpackages -m . /dev/null > Packages
bzip2 -fks Packages
rm -rf ./Packages

echo "Done!"

echo "Uploading to GitHub..."

git add --all
git commit -m "Small Change..."
git push -u origin master

echo "Done!"
