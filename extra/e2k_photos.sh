#!/bin/bash

origen="/datos/media/mldonkey/in/1_FRAN_tech/emule_spy_in"
destino="/datos/media/mldonkey/in/1_FRAN_tech/emule_spy"

#origen=` pwd `
#destino=${origen}_fecha


if [ ! -d $destino ] ; then
	mkdir $destino
fi

ls $origen | wc -l

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for f in ` find $origen -type f  ` ; do
	
	#dir=`exiftool -T -d '%Y%m%d' -createdate $f `
	dir=`exiftool -T -serialnumber $f `

	echo file: $f 
	echo exif_serial: $dir

	if [ "$dir" == "-" ] ; then
		dir=` md5sum $f | awk '{print $1}' `
		dir=nocam/${dir}
		echo Dir md5 $dir
	else
		dir=cam/${dir}
	fi
		
	dest=${destino}/${dir}

	if [ ! -d "$dest" ] ; then
		mkdir --parents "$dest"
	fi

	file=$(basename "$f")
	base=${file%%.*}
	e=${file##*.}
	e=${e:0:3}
	dest=$dest/${base}.${e}
	
	echo Destino: $dest
	
	mv "$f" "$dest"
	
done
IFS=$SAVEIFS

bash ~/Dropbox/unix_tools/permisos_ml.sh