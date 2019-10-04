#!/bin/bash
# El parámetro 1 y 3 son números
# El parámetro 2 es un operador
if [ $# -eq 3  ]; then
	case $2 in
		+)
			echo "$(expr $1 + $3)"
			exit 0
		;;

		-)
			echo "$(expr $1 - $3)"
			exit 0
		;;

		"*")
			echo "$(expr $1 \* $3)"
			exit 0
		;;

		/)
			echo "$(expr $1 / $3)"
			exit 0
		;;

		*)
			echo "-!! operación inválida para esta humilde calculadora"
		;;

	esac
	exit 2
fi
exit 1
