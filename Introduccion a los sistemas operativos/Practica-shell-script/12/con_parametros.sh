if [ $# -eq 2 ]; then 
	echo "$1 * $2 = $(expr $1 \* $2)"
	echo "$1 + $2 = $(expr $1 + $2)"
	echo "$1 - $2 = $(expr $1 - $2)"
	if [ $1 -gt $2 ]; then
		echo "Mayor: $1"
	else
		echo "Mayor: $2"
	fi
	exit 0
else
	echo "Se necesitan 2 parámetros"
	exit 1
fi
