#!/bin/bash
if [ $# -gt 0  ]; then
	index=1
	cantidad=0
	for path in $*
	do
		#Si no existe en el sistema, cuento la cantidad
		if ! [ -e $path ]; then
			let cantidad++
		#Si existe y la posicion es impar, informo si es archivo o directorio
		elif [ $(expr $index % 2) -eq 1 ] && [ -f $path  ]; then
			echo "$path es un archivo"
		elif [ $(expr $index % 2) -eq 1 ] && [ -d $path  ]; then
			echo "$path es un directorio"
		fi
		let index++
	done
	echo "Cantidad de archivos/directorios inexistentes $cantidad"
fi
