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

