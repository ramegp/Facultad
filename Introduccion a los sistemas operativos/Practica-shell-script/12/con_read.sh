echo "Numero 1:"
read num1
echo "Numero 2:"
read num2
echo "$num1 * $num2 = $(expr $num1 \* $num2)"
echo "$num1 + $num2 = $(expr $num1 + $num2)"
echo "$num1 - $num2 = $(expr $num1 - $num2)"
if [ $num1 -gt $num2 ]; then
	echo "Mayor: $num1"
else
	echo "Mayor: $num2"
fi
