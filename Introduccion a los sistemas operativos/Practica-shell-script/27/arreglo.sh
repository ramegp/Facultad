#!/bin/bash
inicializar(){
	# Inicializa el arreglo como vacío
	arreglo=()
}

agregar_elem(){
	# Agrega al final el parámetro 1
	local size=${#arreglo[*]}
	arreglo[$size]=$1
}

eliminar_elem(){
	# Elimina el elemento que se encuentra en la posición
        # determinada por el parámetro 1
	local size=${#arreglo[*]}
	if [ $1 -ge 0  ] && [ $1 -lt $size  ]; then
		unset arreglo[$1]
	fi
	
}

longitud(){
	# Imprime la longitud del arreglo en pantalla
	echo "${#arreglo[@]}"
}

imprimir(){
	# Imprime todos los elementos del arreglo en pantalla
	echo "${arreglo[*]}"
}

inicializar_Con_Valores(){
	# Crea un arreglo con longitud determinada por el parametro 1
       	# con parametro 2 como elemento de cada posición
	inicializar
	for i in $(seq 0 $(expr $1 - 1))
	do
		arreglo[$i]=$2
	done	
}

GREEN='\033[;32m'
NC='\033[0m'
while true; do
	echo -ne "${GREEN}>>${NC} "
	read cadena
	comando=$(echo $cadena | cut -d: -f1 )
	parametro1=$(echo $cadena | cut -d: -f2)
	parametro2=$(echo $cadena | cut -d: -f3)
	case $comando in
		
		"inicializar")
			inicializar
		;;

		"agregar_elem")
			agregar_elem $parametro1
		;;

		"eliminar_elem")
			eliminar_elem $parametro1
		;;
	
		"longitud")
			longitud
		;;

		"imprimir")
			imprimir
		;;

		"inicializar_Con_Valores")
			inicializar_Con_Valores $parametro1 $parametro2
		;;

		"exit")
			exit 0
		;;


	esac
done
