#!bin/bash

cat soccer_teams.cvs | cut -d "," -f 2 | sort | uniq -c
