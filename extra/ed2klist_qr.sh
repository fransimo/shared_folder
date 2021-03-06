#!/bin/bash



SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for f in $* ; do

	echo $f
	ed2=` ed2k_hash $f `
	echo $ed2
	

	file=$(basename "$f")
	base=${file%%.*}
	e=${file##*.}
	e=${e:0:3}
	dest=${base}.png

	
	echo Destino: $dest
	qrencode -o $dest -s 6 -l H ${ed2}
	echo ${ed2} >> ed2links.txt
	
	
done
IFS=$SAVEIFS

