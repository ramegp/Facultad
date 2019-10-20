#!/bin/bash

bienvenida(){
	echo "|Elija una opcion para ver el contenido de la carpeta		|"
	echo "|Para Salir presione Ctrl+ Z		|"
}

cat(){
        echo "Muestro el archivo"
        $(cat) $(./$1/$2)
        echo "$(cat ./$1/$2)"
}

run(){
        $(bash ./$1)
}

bucle_opciones(){
    while true;
    do
        echo -ne "==>>"
        read comando
        # Obtengo la funcion que elige el usuario
        funcion=$(echo $comando | cut -d":" -f1)
        parametro1=$(echo $comando | cut -d":" -f2)
        echo "$funcion $1 $parametro1"
        $funcion $1 $parametro1
    done         
}

mostrar_carpeta(){
    echo "----------- Archivos en la carpeta --------------"
    echo "$(ls -C1 $1)"
    bucle_opciones $1
}

bienvenida
echo "--------------------------------------------------"

select opcion in $(ls -C1)
do
	case $opcion in    
        $opcion)
                mostrar_carpeta $opcion               
                ;;
        
	esac
done
