#!/bin/bash

origen="/var/lib/mldonkey/incoming/files"
destino="/data/share/organized"

#origen=` pwd `
#destino=${origen}_fecha


if [ ! -d $destino ] ; then
        mkdir $destino
fi

ls $origen | wc -l

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for f in ` find $origen -type f -not -path "$origen/ShareOK/*" ` ; do
        file=$(basename "$f")
        base=${file%%.*}
        e=${file##*.}
        e=` echo $e | cut -d'_' -f 1`
        nd=""

        if [ $e == "doc" ] || [ $e == "DOC" ] || [ $e == "docx" ] || [ $e == "DOCX" ] || [ $e == "pdf" ] || [ $e == "PDF" ] || [ $e == "txt" ] || [ $e == "TXT" ] ; then
            dir="docs"
        else # image
            cr_date=`exiftool -T -d '%Y%m%d' -createdate $f `
            echo date $cr_date

            if [ $cr_date == "-" ] ; then
                    nd="nodate/"
            fi

            dir=`exiftool -T -model -serialnumber $f `
            dir="${dir// /_}"
            dir="${dir//$'\t'/_}"

            echo file: $f
            echo exif_serial: $dir

            if [ "$dir" == "-_-" ] ; then
                    echo "no serial $f"
                    # dir=` md5sum $f | awk '{print $1}' `
                    dir=` ed2k_hash $f | cut -d'|' -f5  `
                    dir=nocam/${dir}
                    echo Dir ed2k $dir
            else
                    dir=cam/${dir}
            fi
        fi

        dest=${destino}/${nd}${dir}

        if [ ! -d "$dest" ] ; then
                sudo mkdir --parents "$dest"
        fi

        dest=$dest/${base}.${e}

        echo Destino: $dest

        sudo mv "$f" "$dest"
done
IFS=$SAVEIFS
