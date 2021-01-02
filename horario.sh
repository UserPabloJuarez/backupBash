#!/bin/bash

fecha=$(date +"%Y-%m-%d")
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
todate=$(date +"%Y%m%d")
cond="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 2 | sed -r 's/[-]+//g'`" 
linea="`stat -c '%n %y' $arr|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'`"

		for aux in $cond; do
			if [[ $aux -ge $todate ]]; then
				tar -cvf /home/uprog/crontab_bk/$linea$fecha'_'$hora / $aux
				#lineo=$(aux ls | head -1)
				echo "Archivo: $lineo"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				#lineo=$(aux ls | head -1)
				echo "Archivo: $lineo"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
		done

		
for i in 1 2 3 4 5  # First loop.
do
       for j in $(seq 1 $i)
       do
           echo  -n "*" 
       done
       echo 
done
		
		
#!/bin/bash

todate=$(date -d 2013-07-18 +"%Y%m%d")  # = 20130718
cond=$(date -d 2013-07-15 +"%Y%m%d")    # = 20130715

if [ $todate -ge $cond ]; #put the loop where you need it
then
 echo 'yes';
fi 


##############################################################
##############################################################
##############################################################


#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
todate=$(date +"%Y-%m-%d")
cond="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 2 | cut -c 6-10`"

		for aux in $cond; do
			if [[ $aux -ge $todate ]]; then
				#tar -cvf /home/uprog/crontab_bk/$linea$fecha'_'$hora / $aux
				#echo "Archivo= $lineaReal"
				echo "Mes/dia= $aux"
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				#echo "Archivo= $lineaNew"
				echo "Mes/dia= $aux"
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
		done

		
if [ $todate -ge $cond ];
then
    break
fi		
		
#***************************************************************************
#***************************************************************************

#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
	#for ((lineaReal=0; lineaReal<$linea; lineaReal++)); do
		for aux in $arr; do
			tim= stat -c stat -c %y $aux| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'
			linea= stat -c '%n %y' $aux| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'
			
			if [[ $tim -ge 10 ]]; then
				#tar -cvf /home/uprog/crontab_bk/$linea$fecha'_'$hora / $aux
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
		done
	#done

#######################################################
#######################################################

#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
#tiempo="`stat -c %y ${arr}| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'`"
tim="`stat -c '%n %y' ${arr}| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'`"
linea="`stat -c '%n %y' ${arr}| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'`"

		for aux in $tim; do
			#for lineaReal in $linea; do
			if [[ $aux -ge 16 ]]; then
				tar -cvf /home/uprog/crontab_bk/$aux$fecha'_'$hora / $aux
				echo "Archivo= $linea"
				echo "Hora= $aux hrs."
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				echo "Archivo= $linea"
				echo "Hora= $aux hrs."
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
			#done;
		done



	for i in a; do 
    for j in b; do 
    echo $i;
    echo $j; 
    done; 
    done	
	
	
	
	
	

#!/bin/bash

fecha=$(date +%y-%m-%d)
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
tim="`stat -c stat -c %y ${arr}|cut -f -2 -d":" --output-delimiter="/var"`"

 while read -r tim
 do
                 echo '---------------------------------'
                 echo $tim
                 tiempo=$(echo "$tim" | sed 's:/var/*.*::')
                 horas=$(echo "$tiempo"| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g')
                 linea=$(echo "$tiempo"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g')
                #segundos=$(echo "$tiempo"| grep -e s)
                echo "horas = $horas"
                 echo "minutos= $minutos"
                #echo "segundos = $segundos"
done
                 if [[ x$horas == x ]]; then
                        if [[ x$minutos == x ]]; then
                                 echo "sin minutos"
                       else
                               nMin=$(echo "$tiempo" | cut -c 1-2)
                                c2=$(echo "$tiempo" | cut -c 2)
                                if [[ $c2 != 'm' ]]
                                then
                                        if [[ $nMin -gt 24 ]]; then
                                                echo "hacer backup $linea"
                                       fi
                              fi
                       fi
                else
                       echo backup $linea
               fi
                echo '---------------------------------'
 done 
 
 fecha de modificacion y actual se reaiza backup si coinciden --> tiempo
 Victor
 Infimador Jose Victor Cortez
 
 #//////////////////////////////////////
stat -c '%n %y' "/home/uprog/bin/ProcesoMachaca"|cut -d ' ' -f 1 | cut -c 16-23
 
stat -c '%n %y' "/home/uprog/bin/ProcesoMachaca"|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[[:space:]]+/,/g'| sed 's/.*\,//g'
stat -c '%n %y' "/home/uprog/bin/tarificador/voz_sms/tarificadorVozSms.pl"| cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'

#/////////////////////////////////////