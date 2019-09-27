#!/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:"
echo "$apellido $nombre"
echo "Su usuario es: $(whoami)"
echo -e "Su directorio actual es:\n$(pwd)"
echo "Elija su directorio a mostrar"
read directorio
echo "$(ls $directorio)"
echo "Espacio libre en el disco $(df -h)"

echo -e "$ #\n$#"
echo -e "$ *\n$*"
echo -e "$ ?\n$?"
echo -e "$ HOME\n$HOME"

