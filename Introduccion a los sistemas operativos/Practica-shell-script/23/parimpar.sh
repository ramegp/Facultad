#!/bin/bash
arreglo=(1 2 3 4 5 6 7 8)
contador=0
for numero in ${arreglo[@]};
do
	if [ $(expr $numero % 2) -eq 0 ]; then
		echo $numero
	else
		let contador++
	fi
done
echo "numeros impares: $contador"
exit 0
