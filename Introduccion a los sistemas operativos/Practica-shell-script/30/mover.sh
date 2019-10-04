#!/bin/bash
# $HOME = /pruebas para no romper cosas

# Si no existe el directorio bin, lo creo
if ! [ -e /pruebas/bin ]; then
	mkdir /pruebas/bin
fi

# Recorro cada archivo del directorio actual
cantidad=0
script=$(echo $0 | cut -d/ -f2)
for archivo in $(ls -C)
do
	if [ -f $archivo  ] && [ -x $archivo  ] && [ $archivo != $script  ] ; then
		mv $archivo /pruebas/bin
		echo "Se movió correctamente el archivo $archivo al directorio /pruebas"
		let cantidad++
	fi
done

if [ $cantidad -eq 0 ]; then
	echo "No se movió ningún archivo"
else
	echo "Se movieron $cantidad archivos al directorio /pruebas"
fi
