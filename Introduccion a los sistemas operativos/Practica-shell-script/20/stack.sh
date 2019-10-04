#!/bin/bash

bienvenida(){
	echo "|push:<elemento>|| Agrega un elemento a la pila		|"
	echo "|pop: 		|| Quita un elemento de la pila		|"
	echo "|length:	|| Devuelve el tamaño de la pila	|"
	echo "|print:		|| Imprime los elementos de la pila	|"
}

push(){
	# Asigna el elemento recibido al último lugar del array
	local size=${#STACK[*]}
	STACK[$size]=$1
}

print(){
	# Imprime el array
	echo ${STACK[@]}
}

length(){
	#Devuelve el tamaño del array
	echo ${#STACK[@]}
}

esta_vacia(){
	#Devuelve si el array está vacio
	[ ${#STACK[@]} -eq 0 ]
	return $?
}

pop(){
	#Elimina el último elemento del array y lo imprime
	if ! esta_vacia; then
		local size=$(expr ${#STACK[@]} - 1)
		echo ${STACK[$size]}
		unset STACK[$size]
	fi
}

#Inicializo stack
STACK=()
GREEN='\033[0;32m'
#Mensaje de información de comandos
bienvenida
#Bucle de opciones
while true;
do
	#Comienza el input para el usuario
	echo -ne "${GREEN}>> "
	read comando
	#Obtengo la función que elige el usuario
	funcion=$(echo $comando | cut -d":" -f1)
	#Obtengo el primer parámetro
	parametro1=$(echo $comando | cut -d":" -f2)
	#Invoco a la funcion correspondiente
	$funcion $parametro1
done
