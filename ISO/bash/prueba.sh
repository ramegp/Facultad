#!/bin/bash
echo 'Adivina el Numero'
echo 'Una pista, es entre 0 y 10'
num=$(($RANDOM%100))
echo "$num"
read numb
if [ $num = $numb ];
then
echo "Acertaste era $num"
else
echo "Error el numero era $num"
fi
