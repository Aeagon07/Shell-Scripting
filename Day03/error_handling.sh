#!/bin/bash

create_directory() {
	mkdir demo
}

#how we do handling if this is already exist in the repo

if ! create_directory; then
	echo "The code is beign exist alreday"
	exit 1

fi

echo "This part of code never be executed if there is demo directory in the repo"

