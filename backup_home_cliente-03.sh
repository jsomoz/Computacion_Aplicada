#!bash
#Primero se ejecuta /media/disco_backups/crea_carpetas.sh
ping -q -c 1 192.168.20.3
if [ $? = 0 ]
then
{ DATE=$(date +%Y-%m-%d_%H:%M:%S)
  rsync -avzh user_fileserver@192.168.20.3:/home/jsomoz /media/disco_backups/disco_backups/backup/$DATE.tar.gz
  echo Backup de la carpeta fue realizada
}
else
echo No se pudo realizar el backup, no hay conexion.
fi
