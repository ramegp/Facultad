#!/bin/bash
for ((i=1; i <= 100; i++));
do
	echo "$i ====> $i^2 = $(expr $i \* $i)"
done
