#!/bin/bash
# Código de error 4: El parámetro recibido no es un directorio
# Código de error 87: Se han enviado más de 1 parámetro ó no se ha enviado ningún parametro
if [ $# -ne 1  ]; then
	exit 87
elif ! [ -d $1  ]; then
	exit 4
fi
# Cantidad de archivos con permisos de lectura y escritura del directorio
# pasado por parámetro
cantidad=0
# Recorro cada archivo que contiene el directorio
for archivo in $(ls -C $1)
do
	# Si es un archivo y tiene permisos de lectura-escritura...
	if [ -f "$1/$archivo" ] && [ -w "$1/$archivo" ] && [ -r "$1/$archivo" ]; then
		# ...lo cuento
		echo "El archivo $archivo es de lectura-escritura"
		let cantidad++
	fi
done

echo "La cantidad de archivos de lectura/escritura en el directorio $1 es: $cantidad"
exit 0
