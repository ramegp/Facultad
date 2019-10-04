#!/bin/bash

verArchivo(){
	# Busca si el archivo está en el arreglo, devuelve la posición + 1
	# Retorna 0 si no está en el arreglo
	index=1
	for archivo in ${arreglo[*]}
	do
		if [ $archivo = $1  ]; then
			echo "El archivo $1 está en el arreglo"
			return $index
		fi
		let index++
	done
	echo "El archivo $1 no está en el arreglo"
	return 0
}

cantidadArchivos(){
	echo "Cantidad de archivos ${#arreglo[*]}"
}


borrarArchivo(){
	# Borra un archivo logicamente o fisicamente
	verArchivo $1
	retorno=$?
	# Si está en el arreglo
	if [ $retorno -ne 0 ]; then
		echo -ne "${RED} Eliminar lógicamente? S/n ${NC}"
		read choice
		pos=$(expr $retorno - 1)
		case $choice in
			"n")
				sudo rm ${arreglo[$pos]}
				unset arreglo[$pos]
				echo "El archivo $1 se borró correctamente"
			;;

			*)
				unset arreglo[$pos]
			;;
		esac
	else
		echo "Archivo no encontrado"
		exit 10
	fi
}

# Arreglo en donde van a estar todos los archivos del directorio $HOME
arreglo=()
# Total de lineas del resultado del find
lineas=$(sudo find /pruebas -name *.doc | wc -l)
# Itero por cada linea del resultado y la agrego al arreglo
for linea in $(seq 1 $lineas)
do
	# Agrego al arreglo el archivo .doc
	# Muestro hasta la linea del iterador con el head y luego de esas linea tomo
	# la última para quedarme con la línea correspondiente
	arreglo[$(expr $linea - 1)]=$(sudo find /pruebas -name *.doc| head -$linea | tail -1)
done

# Colores
RED='\033[;31m'
GREEN='\033[;32m'
NC='\033[0m'
# Input para el usuario
while true; do
    	echo -ne "${GREEN}>>${NC} "
   	read cadena
  	comando=$(echo $cadena | cut -d: -f1 )
	parametro1=$(echo $cadena | cut -d: -f2)
	case $comando in
		"verArchivo")
			verArchivo $parametro1
		;;

		"cantidadArchivos")
			cantidadArchivos
		;;

		"borrarArchivo")
			borrarArchivo $parametro1
		;;
		
		"imprimir")
			echo ${arreglo[*]}
		;;
	esac
done
