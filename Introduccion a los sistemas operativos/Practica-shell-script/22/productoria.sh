arreglo=(2 3 4 5)
result=1
for numero in ${arreglo[@]};
do
	result=$(expr $result \* $numero)
done
echo $result
