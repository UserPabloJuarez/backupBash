
#!/bin/bash


IDS="`ps eaxo etime,pid,comm | egrep "miramsisdn" | grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]" | awk '{print $2}'`"

for i in ${PIDS}; do
	echo "Killing $i"
	echo $i | xargs kill -9
done
	
	
	PIDS="`ps eaxo bdstime,pid,comm | egrep "miramsisdn" | grep " 0:" | awk '{print $2}'`" -> Tiempo CPU
	PIDS="`ps eaxo etime,pid,comm | egrep "miramsisdn" | grep " 0:" | awk '{print $2}'`"     -> Tiempo ejecución
	PIDS="`ps eaxo etime,pid,comm | egrep "miramsisdn" | grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]" | awk '{print $2}'`"   -> Tiempo ejecución cambiado
	PIDS="`ps eaxo etime,pid,comm | egrep "miramsisdn" | grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]" | awk '{print $2}'`"   -> Tiempo ejecución
	
	ps eaxo etime,pid,comm | egrep "backups.sh" | grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]"| awk '{print $2}'
	
	crontab ls | grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]"
	ls -l | grep "[0-9\{1,2}:[0-9\{1,2}"	
	ls -l | grep " 0:"
	
	ps -eo comm,etime,user | grep miramsisdn
    --La siguiente salida muestra que el servicio HTTPD se ha estado ejecutando durante 1 hora, 48 minutos y 17 segundos.
	
	Ruta proceso miramsisdn: /home/uprog/bin
	Ejecución -> ./miramsisdn
	Ruta proceso procesokill2.sh: /home/uprog
	Ejecución -> ./ procesokill2.sh
	
***********************************************
#!/bin/bash


IDS="`ps eaxo etime,pid,comm | egrep "miramsisdn" | grep " :0" | awk '{print $2}'`"

for i in ${PIDS}; do
	echo "Killing $i"
	echo $i | xargs kill -9
done