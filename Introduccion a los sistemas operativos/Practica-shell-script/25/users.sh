#!/bin/bash
# De la salida del cat tomo solo la línea del user (field 4)
# y luego reemplazo las comas por espacios para que el bash
# lo tome como un array
arreglo_users=($(sudo cat /etc/group | grep users | cut -d: -f4 | tr , ' '))
case $1 in
	"-b") 
		if [ $2 -lt ${#arreglo_users[@]}  ] && [ $2 -ge 0 ]; then
			echo "El elemento en la posición $2 es: ${arreglo_users[$2]}"
		else
			echo "Fuera de rango"
		fi
	;;
	"-l")
		echo "Longitud del arreglo: ${#arreglo_users[*]} elementos"
	;;
	"-i")
		for ((i=0;i<${#arreglo_users[*]};i++))
		do
			echo "Posición $i: ${arreglo_users[$i]}"
		done
	;;
esac

