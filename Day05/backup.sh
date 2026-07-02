#!/bin/bash

<< readme 

This is a script for backup for 5 days rotation 

Usage: 
	./backup.sh <path to your source> <path to backup folder>

readme

function display_user {
	echo "Usage: ./backup.sh <path to your source> <path to backup folder>"
}

if [ $# -eq 0 ]; then
	display_user
fi


source_dir=$1
dest_dir=$2
time=$(date '+%Y-%m-%d-%H-%M-%S')

function create_back {
	
	# If we do not want the output to print we can simply redirect into black hole here the output is not store and get discarded!
	zip -r "${dest_dir}/backup_${time}.zip" "${source_dir}" > /dev/null
	
	# What is meaning of the #? => output of the above command
	if [ $? -eq 0 ]; then
		echo "backup generated successfully for ${time}"
	fi
}

function perform_rotation {
	# get the backups acc to their time
	backups=($(ls -t "${dest_dir}/backup_"*.zip 2>/dev/null))

	if [ "${#backups[@]}" -gt 5 ]; then
		echo "performing rotation for 5 days"
		
		backups_to_remove=("${backups[@]:5}")
		echo "${backups_to_remove[@]}" > /dev/null

		for backup in "${backups_to_remove[@]}";
		do
			rm -f ${backup}
		done	
	fi	
}


create_back

perform_rotation


