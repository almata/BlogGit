#!/bin/bash

printf '<!-- AUTO-GENERATED CONTENT: Do not edit README.md by hand or your changes will be lost -->\n'
printf '<!-- AUTO-GENERATED CONTENT: Use readme-header-content.md and readme-footer-content.md instead -->\n\n'

#
# Add the readme-header-content
#
cat readme-header-content.md
printf '\n\n'

#
# Next five commands exist to add the line "42 notes so far. Last added: My last shiny note"
# You totally can delete them if you feel they add too much complexity only to show this line
#
notes=$((`find . -type f -not -path '*/\.*' | wc -l` - `find . -maxdepth 1 -type f -not -path '*/\.*' | wc -l`))
last=`find . -type f -not -path '*/\.*' -mindepth 2 -print0 | xargs -0 stat -f "%m %N" | sort -rn | head -1 | cut -f2- -d" "`
title=`head -1 $last | cut -c 3-`
printf '\n__'$notes' notes so far. Last added:__ '
echo '['$title']('`echo $last | cut -c 3-`')'

#
# Get all notes directories (the ones not starting with '.') in alphabetical order
#
dirs=`ls -d */ | sort -f`

#
# Iterate notes directories and show a category link for each of them 
#
printf '\n## Categories\n\n'
for dir in $dirs
do
	dname=${dir%?} # remove the final '/' character
	dlowr=`echo $dname | tr '[:upper:]' '[:lower:]'` # convert to lowercase
	printf '* ['$dname'](#'$dlowr')\n'
done
printf '\n'

#
# Iterate notes directories again and show all content inside each of them
#
for dir in $dirs
do
	printf '## '${dir%?}'\n\n'
	for file in `ls $dir*.md`
	do
		title=`head -1 $file | cut -c 3-` # remove the initial '# ' from the first line 
		echo '* ['$title']('$file')'
	done
	printf '\n'
done

#
# Add the readme-footer-content
#
cat readme-footer-content.md
