#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

# du -hs /home/uprog/bin/* | grep G

$ArrayString ="`crontab -l | find / -atime 1 |eaxo etime,pid,comm | egrep "miramsisdn" | grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]" | awk '{print $2}'`"

tar -cvf /home/uprog/crontab_bk/crontab_$fecha'_'$hora /home/uprog/bin

#*****************************

#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

ArrayString ="`crontab -l >> /home/uprog/crontab_bk/crontab_$fecha'_'$hora`"

echo $$ArrayString

#tar -cvf /home/uprog/crontab_bk/crontab_$fecha'_'$hora /home/uprog/bin



#################################################################

#!/bin/bash
fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

$ArrayString = `crontab -l | egrep ["*.pl"]| grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]"` | awk '{print $2}' //ArrayString = {"/home/uprog/bin/procesos.pl, home/uprog/bin/procesos.pl"}

for aux in ${ArrayString}
	do
	$fecha = ls -l aux
	
	if(fecha <= 1 dia){
		echo "se ejecuto ${aux}";
	}
	done

#################################################################
#!/bin/bash
#Proposito = sacar backup de carpeta DATA
#Fecha = 30/11/2016
#Author = Granados Santos Jhoon
#Version 1.0
#START
 
TIME=$(date +%y%m%d)            # Este comando agregará fecha en nombre de archivo.
SRCDIR= crontab -l              # Ubicación del directorio de backup.
DESDIR=/home/uprog/crontab_bk   # Destino del archivo de copia de seguridad.
FILENAME=DESDIR_$TIME.tar.gz    # Aquí defino el formato y nombre de archivo.
 
tar -cpzf $DESDIR/$FILENAME $SRCDIR
 
#END

#################################################################
#################################################################
#!/bin/bash
#Proposito = sacar backup de carpeta DATA
#Fecha = 30/11/2016
#Author = Granados Santos Jhoon
#Version 1.0
#START
 
TIME=$(date +%y%m%d)            # Este comando agregará fecha en nombre de archivo.
FILENAME=backup-$TIME.tar.gz    # Aquí defino el formato y nombre de archivo.
SRCDIR=/data                    # Ubicación del directorio de backup.
DESDIR=/backup                  # Destino del archivo de copia de seguridad.
 
tar -cpzf $DESDIR/$FILENAME $SRCDIR
 
#END

#################################################################

#!/bin/bash
 
lista=`crontab -l`
for fichero in $lista
do
        echo $fichero
done
 
stat para validar tiempo de modificacion 24 hrs --> ruta entera 

###############################################################
ps eaxo etime,pid,comm | egrep "tarificadorDatos.pl"| grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]"| awk '{print $2}'
ps exo "etime,pid,comm" | egrep "tarificadorVozSms.pl"| grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]"| awk '{print $2}'
ps axo user,stat,pid,pcpu,comm | egrep "/home/uprog/bin/tarificador/datos/tarificadorDatos.pl"
ps eaxo etime,pid,comm | egrep "tarificadorDatos.pl"| grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]"| awk '{print $2}'

perl /home/uprog/bin/ProcesoMachaca

/home/uprog/bin/tarificador/datos/tarificadorDatos.pl
/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl
/home/uprog/bin/tarificador/datos/tarificadorDatosDeg.pl
/home/uprog/bin/tarificadorNG/tarificadorDatosNG.pl

/home/uprog/bin/tarificadorNG/tarificadorNG.pl
/home/uprog/bin/ProcesoProvision
/home/uprog/bin/ProcesoPortabilidadGestion

/home/uprog/bin/Portabilidades/mvnoPortabilidadesGestionLineas.pl
/home/uprog/bin/Portabilidades/relanzaPortasAccsPerme.pl
/home/uprog/bin/mvnoParches/mvnoActualizaPortasAlarmado.pl

perl /home/uprog/bk_crontab/crontabBK.pl

perl /home/uprog/bin/ProcesoPortabilidadCancelada.pl

/home/uprog/crontab_bk/backups.sh

find ./bin -iname "tarificadorDatos.pl"
find ./bin -iname "*.pl"
find / -type f -name "ProcesoProvision"
find / -atime 1 #--> indica mas de un dia
find / -atime 2 #--> indica mas de dos dias
find ./Documentos -name archivo.txt
locate ./bin tarificadorDatos.pl

find / -name "[0-9]*"     (todo lo que empieze con un dígito)
find / -name "[Mm]*"      (todo lo que empieze con un la letra M o m)
find ./bin -name "[t-u]*.pl" (todo lo que empieze entre a y m y termine en ".txt")
find ./bin -name "[t]*.pl"      (todo lo que empieze con un la letra M o m)
sudo ls -l / crontab
crontab -l | find ./bin -iname "*.pl"
crontab -l | find ./bin -iname "["tarificadorDatos"]*.pl"
crontab -l | find ./datos -iname "*.pl"#./voz_sms ./tarificadorNG ./Portabilidades ./mvnoParches -iname "*.pl"
crontab -l | find ./bin/tarificador/datos/ -iname "[t]*.pl"
crontab -l | find ./uprog/bin/tarificador/datos/ -iname "[t]*.pl"
crontab -l | grep "tarificadorDatos.pl"|
crontab -l | find ./bin -iname "tarificadorDatos.pl"
crontab -l | find ./bin/tarificadorNG/ -iname "*.pl"
crontab -l | egrep ["mvno(.pl)+"]|


