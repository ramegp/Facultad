#!/bin/bash
# Parámetro 1 directorio
# Parámetro 2 opción
# Parámetro 3 cadena
for archivo in $(ls -C1 $1)
do
	if [ -f $1/$archivo  ] && [ $2 = -a  ]; then
		mv $1/$archivo $1/$archivo$3
	elif [ -f $1/$archivo  ] && [ $2 = -b  ]; then
		mv $1/$archivo $1/$3$archivo 
	fi
done
