function permisos {
	sudo chown -R mldonkey.mldonkey $1
	sudo find $1  -type f -exec chmod 644 {} \;
	sudo find $1  -type d -exec chmod 775 {} \;
}

permisos /datos/media/mldonkey/
permisos /datos/media/archivo/coleccion/
permisos /datos/compartido
