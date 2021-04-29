#!/usr/bin/bash

while getopts "m:" arg
do
    case $arg in
	m)
	    msg=\"$OPTARG\"
	    ;;
	?)
	echo "unknown argument"
	exit 1
	;;
    esac
done

JEKYLL_ENV=production bundle exec jekyll build
wait
git add .
git commit -a -m $msg
wait

git branch -D master
git checkout -b master
git filter-branch --subdirectory-filter _site/ -f
wait
git checkout source
git push --all origin
