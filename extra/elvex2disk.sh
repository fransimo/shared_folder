sudo mount -t cifs //192.168.1.6/data /datos/net/diskstationfsm/ -ousername=fran,password=gratis,uid=fran,gid=fran,forceuid,forcegid,nounix


rsync -avz  /datos/flickrGramas/jenkins/up_ok /datos/net/diskstationfsm/d4/Proyectos4/Dream/contacts

sudo bash ~/workspace/shared_folder/extra/e2k_photos.sh > log.txt

rsync -avz  /datos/media/mldonkey/in/1_FRAN_tech/emule_spy /datos/net/diskstationfsm/d4/Proyectos4/shared_folder

sudo rm -fR /datos/media/mldonkey/in/1_FRAN_tech/emule_spy/*

