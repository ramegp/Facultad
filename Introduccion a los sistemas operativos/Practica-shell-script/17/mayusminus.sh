#!/bin/bash
for archivo in $(ls -C)
do
	if [ -f $archivo ] && [ $archivo != 'mayusminus.sh'  ]; then
		nuevo_nombre=$(echo $archivo | tr '[:upper:][:lower:]' '[:lower:][:upper:]' | tr -d "aA")
		mv $archivo $nuevo_nombre
	fi
done
