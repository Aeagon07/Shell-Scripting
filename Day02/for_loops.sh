#!/bin/bash

<< comment 
1 is agrument of folder name
2 is the start 
3 is end 

comment


for (( i = $2 ; i <= $3; i++))
do
	mkdir "$1$i"
done

