#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

norm() {
	RED='\033[0;31m'
	NC='\033[0m'
	echo "\n\t\t**************************************************************************************"
	echo "\t\t*\t\t\t\t\t\t\t\t\t	     *"
	echo "\t\t*\tScript to do norminette on all files inside the directory that you're in!    *"
	echo "\t\t*\tDirectories cant have spaces between them, \t\t\t\t     *"
	echo "\t\t*\t\t\t\t\t\t\t\t\t	     *"	
	echo "\t\t**************************************************************************************\n"	

	cfiles=($(find . -type f -name "*.c"))
	hfiles=($(find . -type f -name "*.h"))
	if [[ -z $cfiles ]]; then
		echo "\n\t$RED.c files not found $NC\n"
	fi
	if [[ -z $hfiles ]]; then
		echo "\n\t$RED.h files not found $NC\n"
	fi
	touch error_file_norm.txt
	norminette $cfiles $hfiles | grep -v "OK!" > error_file_norm.txt
}

remove_lines() {

	cat error_file_norm.txt | grep 'Space on empty line'
	cat error_file_norm.txt | grep 'Error!'
	# while read line; do
	# 	echo $line | grep ".c"
	# 	# if [! -n line_c ]; then
	# 	# 	echo this is the .c line $line_c
	# 	# fi
	# 		echo this is the .c line $line_c
	# done < error_file.txt
	# rm error_file.txt
}


norm
remove_lines
