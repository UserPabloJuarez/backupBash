crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*,0-9>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'

crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| sed -r 's/[>>]+/;/g'|tr -d '[[:space:]]' 

crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"
########OPCION 3######################################
#!/bin/bash
fecha=$(date +"%Y-%m-%d")
hora=$(date +%H:%M)
todate=$(date +"%Y%m%d")

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
dbServersList="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 1-2| sed -r 's/[-]+//g'| sed 's/.*\///g'| sed -r 's/[[:space:]]+/:/g'`"
cond="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 2 | sed -r 's/[-]+//g'`"
#dbServersList=('ProcesoMachaca:20190802' 'tarificadorVozSms.pl:20180703' 'tarificadorDatos.pl:20160315' 'mvnoActualizaPortasAlarmado.pl:20201216' 'relanzaPortasAccsPerme.pl:20170716')

    # Loop over DB servers
for someDbServer in ${dbServersList[@]}
do
       # delete previous array/list (this is crucial!)
       unset dbNamesList
       # split sub-list if available
       if [[ $someDbServer == *":"* ]]
       then
           # split server name from sub-list
           tmpServerArray=(${someDbServer//:/ })
           someDbServer=${tmpServerArray[0]}
           dbNamesList=${tmpServerArray[1]}
           # make array from simple string
           dbNamesList=(${dbNamesList//,/ })
       fi
	   
	   # Loop over databases
       for someDB in ${dbNamesList[@]}
       do
         if [[ $someDB -ge $todate ]]; then
		   #tar -cvf /home/uprog/crontab_bk/$someDbServer'_'$fecha'_'$hora / $someDB
           echo "Se realiza el backup con exito!"
           echo "Fecha del sistema: $someDB"
         else
           echo "No es necesario realizar el backup: "
           echo "Fecha del sistema: $someDB"
         fi
       done;
       
	   if [[ $aux -ge ${tmpServerArray[1]} ]]; then
        echo -e "Archivo: $someDbServer"
			  tmpServerArray=(${someDbServer//:/ })
			  someDbServer=${tmpServerArray[0]}
			  dbNamesList= ${tmpServerArray[1]}
			  dbNamesList=(${dbNamesList//,/ })                               
				echo "fecha actual: $todate"
				echo '---------------------------------'
      else
        echo -e "Archivo: $someDbServer"
				tmpServerArray=(${someDbServer//:/ })
			    someDbServer=${tmpServerArray[0]}
				someDbServer= ${tmpServerArray[1]}
				dbNamesList=(${dbNamesList//,/ })
				echo "fecha actual: $todate"
				echo '---------------------------------'
			fi
       
	done
	
########################################################
########################################################
########################################################

    for aux in $cond; do
			unset cond
			if [[ $aux -ge $todate ]]; then
        echo -e "\n-$someDbServer"
			  echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
      else
        echo -e "\n-$someDbServer"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "No es necesario realizar el backup: "
        echo '---------------------------------'
			fi
    done;

    
done

########OPCION 2######################################
#!/bin/bash

fecha=$(date +"%Y-%m-%d")
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
todate=$(date +"%Y%m%d")
cond="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 2 | sed -r 's/[-]+//g'`" 
linea="`stat -c '%n %y' $arr| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'`"

		for aux in $cond; do
			for lineaNew in $linea; do
			if [[ $aux -ge $todate ]]; then
				echo "Archivo = $lineaNew"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				echo "Archivo = $lineaNew"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
			done;
		done
		
		for aux in $cond; do
			if [[ $aux -ge $todate ]]; then
				tar -cvf /home/uprog/crontab_bk/$aux'_'$fecha'_'$hora /* $aux
			fi
		done
		
########OPCION 1######################################

#!/bin/bash

fecha=$(date +"%Y-%m-%d")
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
todate=$(date +"%Y%m%d")
cond="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 2 | sed -r 's/[-]+//g'`" 
#linea="`stat -c '%n %y' $arr|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'`"

		for aux in $cond; do
			if [[ $aux -ge $todate ]]; then
				tar -cvf /home/uprog/crontab_bk/$aux'_'$fecha'_'$hora /* $aux
				#echo "Archivo = $lin"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				#echo "Archivo = $lin"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
		done
		
########PRUEBA----######################################
#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
tim="`stat -c stat -c %y ${arr}|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'`"
linea="`stat -c '%n %y' ${arr}| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'`"| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'

		for aux in $tim; do
			if [[ $aux -ge 16 ]]; then
				#tar -cvf /home/uprog/crontab_bk/$linea$fecha'_'$hora / $aux
				#echo "Archivo= $lineaReal"
				echo "Hora= $aux hrs."
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				#echo "Archivo= $lineaNew"
				echo "Hora= $aux hrs."
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
		done


		
#!/bin/bash
fecha=$(date +"%Y-%m-%d")
hora=$(date +%H:%M)
todate=$(date +"%Y%m%d")

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
dbServersList="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 1-2| sed -r 's/[-]+//g'| sed 's/.*\///g'| sed -r 's/[[:space:]]+/:/g'`"
cond="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 2 | sed -r 's/[-]+//g'`"

    # Loop over DB servers
for someDbServer in ${dbServersList[@]}
do
       # delete previous array/list (this is crucial!)
       unset dbNamesList
       # split sub-list if available
       if [[ $someDbServer == *":"* ]]
       then
           # split server name from sub-list
           tmpServerArray=(${someDbServer//:/ })
           someDbServer=${tmpServerArray[0]}
           dbNamesList=${tmpServerArray[1]}
           # make array from simple string
           dbNamesList=(${dbNamesList//,/ })
       fi
	   
	   # Loop over databases
       for someDB in ${dbNamesList[@]}
       do
         if [[ $someDB -ge $todate ]]; then
           echo "Se realiza el backup con exito!"
           echo "Fecha del sistema: $someDB"
         else
           echo "No es necesario realizar el backup: "
           echo "Fecha del sistema: $someDB"
         fi
       done;
       
	   if [[ $aux -ge ${tmpServerArray[1]} ]]; then
        echo -e "Archivo: $someDbServer"
			  tmpServerArray=(${someDbServer//:/ })
			  someDbServer=${tmpServerArray[0]}
			  dbNamesList= ${tmpServerArray[1]}
			  dbNamesList=(${dbNamesList//,/ })                               
				echo "fecha actual: $todate"
				echo '---------------------------------'
      else
        echo -e "Archivo: $someDbServer"
				tmpServerArray=(${someDbServer//:/ })
			    someDbServer=${tmpServerArray[0]}
				someDbServer= ${tmpServerArray[1]}
				dbNamesList=(${dbNamesList//,/ })
				echo "fecha actual: $todate"
				echo '---------------------------------'
			fi
       
	done		
	

#####################################################
#####################################################

for timRe in $tim; do
	echo $timeRE
done

for aux in $result; do

  if [[ $tim -ge 24 ]]; then
		tar -cvf /home/uprog/crontab_bk/serviciosCron_$fecha'_'$hora / $aux
  else
		echo "es menor de 24 horas"
  fi
done


#Ejemplo################################################################

#!/bin/bash

foreach (var x in DIR_EXCLUIDOS){
	echo "ingreso a realizar proceso ${DIR_EXCLUIDOS}"
}

$ArrayString = crontab -l | grep $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS| lo que sea //ArrayString = {"/home/uprog/bin/procesos.pl, home/uprog/bin/procesos.pl"}

foreach (var aux in ArrayString){
	$fecha = ls -l aux
	
	if(fecha <= 1 dia){
		hacer copia de aux;
	}
}

########################################################

#!/bin/bash

for var in "*.pl"; do

	echo "/home/uprog/bin/tarificadorNG/$var"

done


#!/bin/bash

file=("./bin/tarificador/datos/" "./bin/tarificador/voz_sms/" "./bin/tarificador/datos/" "./bin/tarificadorNG/" "./bin/Portabilidades/" "./bin/Portabilidades/" "./bin/mvnoParches/")

IFS=$'\n'

for var in "tarificadorDatosNG.pl"; do

	echo "$file$var"

done

#######################################################
#!/bin/bash
fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

file=("/home/uprog/bin/tarificadorNG/")
my_file="tarificadorDatosNG.pl"
IFS=$'\n'

for aux in $my_file; do
	
	echo "$file$aux"
	
done




#!/bin/bash
fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

file=("/var/log/thor/tarificadorDatos.log&")
TMP=""
IFS=$'\n'

for aux in ${file[*]}; do
	
	echo "$aux"
	
done

crontab -l | grep /home | cut -d ” ” -f 3- | sed ‘s/(//g’ | sed ‘s/)//g’ | sed ‘s/\[//g’| sed ‘s/\]//g’ | sed ‘s/,//g’ | sed “s/’//g”

Los temas log la almoadilla los espacios

sed 's /.*\.//'log

crontab -l | sed -r 's/[*,0-9>\&$()+%_]+//g'| sed -r 's/perl//g'| sed 's:/var/.*::'| sed -r 's/[[:space:]]+//g'| sed 's/.*\.//g'log #sed -r 's/tarificadorDatos.log//g'| sed -r 's/tarificadorVozSms.log//g'| sed -r 's/tarificadorDatosDeg.log//g'

crontab -l | sed 's/.*\/h//g'
crontab -l | sed 's/.*\/2//g'

crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"    #tr -d '[[:space:]]'  #tr "\n" ","

echo 'comuníquese al 0-800-WIKI' | tr '[:digit:]' '[2*3][3*3][4*3][5*3][6*3][7*4][8*3][9*4]'

stat "/home/uprog/bin/ProcesoMachaca"| sed 's:[Access,Change].*::'| sed 's:Fil.*::'| sed -r 's/[A-Z]+//g'| sed -r 's/[a-z]+//g'| sed 's:/.0000/.*::'
stat "/home/uprog/bin/ProcesoMachaca"| sed -r 's/[A-Z]+//g'| sed -r 's/[a-z]+//g'
stat "/home/uprog/bin/ProcesoMachaca"| sed 's:[Access].*::;s:[Change].*$::'| sed -r 's/[:alpha:]+//g'| sed -r 's/[a-z]+//g'
stat -c '%n %A %.19z' "/home/uprog/bin/ProcesoMachaca"| sed -r 's/[a-z]+//g'| sed -r 's/[/_VS.-]+//g'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'
########################
########################
stat -c '%n %A %.19z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| sed -r 's/[a-z]+//g'| sed -r 's/[/_VS.-]+//g'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'| date +"%H"
stat "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| sed 's:[A-L].*::'| sed 's:[N-Z].*::'| sed 's/.*\Modify: //g'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g' #sed 's:/.0/.*::'
stat "/home/uprog/bin/ProcesoMachaca"| sed 's:[A-L].*::'| sed 's:[N-Z].*::'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\Modify:,, //g'| tr " \t" "\n" | tr -s "\n"
########################
stat -c '%n %A %z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl" | sed 's/\(:[0-9]\{2\}\)\.[0-9]* /\1 /'
stat -c '%n %A %.19z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| sed 's/.*\///g'| sed -r 's/[-:0-9]+//g'| sed -r 's/[[:space:]]+/_/g'
stat -c '%n %A %.19z' "/home/uprog/bin/Portabilidades/relanzaPortasAccsPerme.pl"| sed 's/.*\///g'| sed -r 's/[-:0-9]+//g'| sed -r 's/[[:space:]]+/_/g'
#######
stat -c '%n %A %z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| grep -e h
"/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| grep -e m
stat -c '%n %A %z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| cut -d ' ' -f 3
"/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| cut -c 1-2

stat -c '%n %A %.19z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| sed -r 's/[a-z]+//g'| sed -r 's/[/_VS.-]+//g'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'| cut -d ' ' -f 3
stat -c '%n %A %.19z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| cut -d ' ' -f 3

stat -c '%n %y %.19z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| cut -d ' ' -f 2
stat -c '%n %y %.19z' "/home/uprog/bin/ProcesoMachaca"| cut -d ' ' -f 1 | cut -c 6-10
stat -c '%n %y' "/home/uprog/bin/ProcesoMachaca"|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'
stat -c '%n %y %.19z' "/home/uprog/bin/ProcesoMachaca"| cut -d ' ' -f 2 | sed -r 's/[-]+//g'
stat -c '%n %y %.19z' "/home/uprog/bin/ProcesoMachaca"| cut -d ' ' -f 1-2| sed -r 's/[-]+//g'| sed 's/.*\///g'| sed -r 's/[[:space:]]+/:/g'
stat -c '%n %y %.19z' "/home/uprog/bin/ProcesoMachaca"| cut -d ' ' -f 1-3|sed -r 's/[[:space:]]+/,/g'| 's:/var/*.*::'| sed 's/.*\,//g'

stat -c '%n %A %.19z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| sed -r 's/[a-z]+//g'| sed -r 's/[/_VS.-]+//g'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'
stat -c '%n %A %.19z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| sed -r 's/[a-z]+//g'| sed -r 's/[/_VS.-]+//g'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'

stat "/home/uprog/bin/ProcesoMachaca"| cut -d ' ' -f 3| sed 's/.*\-//g'
acceso --> stat -c %x "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"
modificacion --> stat -c %y "/home/uprog/bin/ProcesoMachaca"
stat -c '%n %A %.19z' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| sed -r 's/[a-z]+//g'| sed -r 's/[/_VS.-]+//g'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'
stat -c stat -c %y "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'

crontab -l | sed 's:/var/log/thor/*::' | sed 's:*.log::'
crontab -l | sed 's:*.log::'

crontab -l | grep 'pl' |sed -r 's/[*,#0-9]+//g'| sed -r 's/[[:space:]]+//g'| sed -r 's/perl//g'
crontab -l | grep -iE 'plant[0-9]* [0-9]+\.?[0-9]* [0-9]+\.?[0-9]* [0-9]+\.?[0-9]*' |sed -r 's/[*,#0-9]+//g'| sed -r 's/[[:space:]]+//g'| sed -r 's/perl//g'
crontab -l | crontab -l | sed -r 's/t([0-9]{1}) /t00\1 /g'
crontab -l | sed -r 's/[[:space:]]+/,/g'
crontab -l | grep --color -E '[[:space:]*#]'
crontab -l | grep --color -E 's/*/0/'
crontab -l | grep --color -E '.*'0
crontab -l | grep --color -iE '^plant[0-9]*( [0-9]\.[0-9]){3}'


grep --color -E '[[:alpha:]]' crontab -l

#!/usr/bin/env bash

IN="crontab -l | grep --color -E '[[:space:]*#]'"

mails=$(echo $IN | tr "*" "\n")

for addr in $mails
do
    echo "> [$addr]"
done

reemplaria perl por comilla, diviria por espacio split por espacio 1 2 3 4 5 6

#*****////////////

for dir in $PATH; do

	echo "$dir:"

	for myfile in $dir/*; do

		if [ -x $myfile ]; then

			echo " $myfile"

		fi

	done

done

#######################################################
#!/bin/bash
fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

ArrayString = ("crontab -l | egrep ["*.pl"]")

for aux in $ArrayString; do
	
	fecha = $(ls -l aux)
	
	if [ $fecha -le 24 ] ; then
		echo "$aux"
	fi
done



################################
for dir in $PATH; do

	echo "$dir:"

	for myfile in $dir/*; do

		if [ -x $myfile ]; then

			echo " $myfile"

		fi

	done

done




#!/bin/bash

for var in first "the second" "the third" "I’ll do it"; do

	echo "This is: $var"

done

####################################
####################################
####################################

#!/bin/bash

fecha=$(date +"%Y-%m-%d")
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
todate=$(date +"%Y%m%d")
cond="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 2 | sed -r 's/[-]+//g'`" 
linea="`stat -c '%n %y' $arr| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'`"

    
		for aux in $cond; do
			if [[ $aux -ge $todate ]]; then
				tar -cvf /home/uprog/crontab_bk/$aux'_'$fecha'_'$hora /* $aux
				#echo "Archivo = $lin"
			  echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				#echo "Archivo = $lin"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
		done;
		
		
		
		
stat -c '%n %y %.19z' "/home/uprog/bin/ProcesoProvision"| cut -d ' ' -f 2 | sed -r 's/[-]+//g'


function join { local IFS="$1"; shift; echo "$*"; }
result=$(join , ${cond[@]})
result2=$(join , ${cond[@]})
echo $result
echo $result2
#echo ${cond[@]}