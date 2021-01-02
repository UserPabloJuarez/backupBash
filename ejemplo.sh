#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

DIR_EXCLUIDOS=("./bin/tarificador/datos/" "./bin/tarificador/voz_sms/" "./bin/tarificador/datos/" "./bin/tarificadorNG/" "./bin/Portabilidades/" "./bin/Portabilidades/" "./bin/mvnoParches/")
 
ARCHIVOS_EXCLUIDOS=("*.pl")
TMP=""


clear

# Rellenar lista de exclusiones para directorios
for i in ${DIR_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=$i"
done


# AÃ±ade los valores de TMP de nuevo a DIR_EXCLUIDOS en forma de cadena bien formada
DIR_EXCLUIDOS=$TMP
TMP="" # Resetea la variable temporal

# Rellenar lista de exclusiones para archivos
for i in ${ARCHIVOS_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=\"$i\""
done

# AÃ±adir valores a una cadena
ARCHIVOS_EXCLUIDOS=$TMP
TMP="" # Resetea la variable temporal

echo
echo "Archivos --> $ARCHIVOS_EXCLUIDOS"
echo
echo "Directorios --> $DIR_EXCLUIDOS"
echo

echo "ComenzarÃ¡ en cuanto pulses intro"
read TMP


tar -cvf /home/uprog/crontab_bk/crontab_$fecha'_'$hora / $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS

























######################################################
######################################################
#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
tim= "`stat -c '%n %y' ${arr}|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'`"
horas= "`${tim}| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'`"
linea= "`${tim}| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'`"
#tim="`stat -c stat -c %y ${arr}|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'`"

	#for lineaReal in $linea; do
		for aux in $horas; do
		#echo "horas = $horas"
        #echo "Archivo= $linea"
			if [[ $aux -ge 16 ]]; then
				##tar -cvf /home/uprog/crontab_bk/$linea$fecha'_'$hora / $aux
				#echo "Archivo= $linea"
				#echo "Hora= $horas hrs."
				echo "Se realiza el backup excede las horas"
				echo '---------------------------------'
			else
				#echo "Archivo= $linea"
				#echo "Hora= $horas hrs."
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
		done
	#done