#!/bin/bash
# Parámetro 1 extensión
if [ $# -eq 1  ]; then
	echo $(whoami) $(sudo find / -name *.$1 | wc -l) > reporte.txt
fi
