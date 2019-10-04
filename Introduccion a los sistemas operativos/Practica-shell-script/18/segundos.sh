#!/bin/bash
while true;
do
	usuarios_logeados=$(who -u | cut -d" " -f1 | uniq)
	echo $usuarios_logeados
	for usuario in $usuarios_logeados;
	do
		if [ $usuario = $1 ]; then
			echo "El usuario $1 se ha logueado en el sistema"
			exit 0
		fi
	done
	sleep 10
done
