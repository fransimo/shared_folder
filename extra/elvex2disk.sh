home=~/workspace/shared_folder/extra

sudo mount -t cifs //192.168.1.6/data /datos/net/diskstationfsm/ -ousername=fran,password=gratis,uid=fran,gid=fran,forceuid,forcegid,nounix 2> /dev/null

if [ ! -d /datos/net/diskstationfsm/d4 ] ; then
	exit 1
fi

sudo rsync -avz  /datos/flickrGramas/jenkins/up_ok /datos/net/diskstationfsm/d4/Proyectos4/Dream/contacts

#organizar fotos por exif
sudo bash ${home}/e2k_photos.sh > ${home}/log.txt

#pasar las nuevas
#usamos un directorio temporal para que pasar al sea mas rapido
sudo rsync -avz  /datos/media/mldonkey/in/1_FRAN_tech/emule_spy /datos/net/diskstationfsm/d4/Proyectos4/shared_folder

sudo rsync -avz  /datos/media/mldonkey/in/1_FRAN_tech/emule_spy /datos/media/mldonkey/in/1_FRAN_tech/shared_folder

#borrar todo el temporal
#sudo rm -fR /datos/media/mldonkey/in/1_FRAN_tech/emule_spy/*

#borrar solo las que se han borrado en el nas
sudo rsync -avz --delete  /datos/net/diskstationfsm/d4/Proyectos4/shared_folder /datos/media/mldonkey/in/1_FRAN_tech

sudo rsync -avz --delete /datos/flickrGramas/backup /datos/net/diskstationfsm/d4/fg_backup4

#asegurar permisos
sudo bash ${home}/permisos_ml.sh
