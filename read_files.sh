
i=1
while read f; do
	echo "line $i: $f"
	((i++))
done < file.txt

