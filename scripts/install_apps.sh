#!/bin/bash

#iterate through app list
FILE='../config/apps.txt'
while read -r line
do
	#clone project to directory
	DEST_DIR=../../$line;
	mkdir $DEST_DIR;
	git clone https://github.com/bbemis017/$line $DEST_DIR; 

	#install app
	sh $DEST_DIR/scripts/install.sh

done < "$FILE"

#update website and config files
sh update_website.sh
