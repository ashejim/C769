@echo off
title compile html, save to repo folder, update GitHub repo and website
jupyter-book build --all C:\Users\Jim\OneDrive\jupyter-books\C769
echo "Compiling local C:\Users\Jim\OneDrive\jupyter-books\C769 ..."
xcopy /s /e /h /i /y C:\Users\Jim\OneDrive\jupyter-books\C769 C:\Users\Jim\OneDrive\jupyter-books\github_book_repo\C769
echo "Copied local book to ..jupyter-books\github_book_repo\C769 ..."
cd C:\Users\Jim\OneDrive\jupyter-books\github_book_repo\C769 
git add ./*
SET /P Message=Enter git commit comment: 
git commit -m "%Message%"
echo "Commited..."
git push
echo "Pushed..."
ghp-import -n -p -f _build/html
echo "Imported to git page..."
start https://ashejim.github.io/C769/intro.html
echo "Gitpage may take a few minutes to update. END"
cd C:\Users\Jim\OneDrive\jupyter-books