i=0
while [ $i -lt 5 ]; 
do
	let i++
	echo $i
	if [ $i -eq 2 ]; then
		continue
		echo "entra"
	fi
done
