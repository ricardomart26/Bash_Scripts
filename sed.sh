#!bin\bash

cat file.csv | sed 's/Cherno/Cherno City/g' | sed 's/Arda/Arda United/g' > file_edited.csv
