#!/bin/bash

#
# Find the last note, that is the latest modified file in notes directories (the ones not starting with '.')
#
last=`find . -type f -not -path '*/\.*' -mindepth 2 -print0 | xargs -0 stat -f "%m %N" | sort -rn | head -1 | cut -f2- -d" "`
title=`head -1 $last | cut -c 3-`

#
# Update README (always) and CHANGELOG (only if there are new notes)
#
./readme.sh > README.md 
git add -A
notes=`git status --short | grep '\/.*md' | grep -v '\..*\/' | wc -l`
if [ $notes -gt 0 ]
then 
	echo '##' `date '+%F (%H:%M)'` >> CHANGELOG.md
	git status --short | grep '\/' | grep -v '\..*\/' | awk '$0="* "$0' >> CHANGELOG.md
	echo '' >> CHANGELOG.md
fi

#
# Publish everything
#
git add .
git commit -m "$title"
git push -u origin master
