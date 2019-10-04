#!/bin/bash
echo "Porfavor elija una opción:"
select opcion in "Listar" "DondeEstoy" "QuienEsta" "Salir" 
do
	case $opcion in
		Listar)
			echo "$(ls -l)"
		;;

		DondeEstoy)
			echo "$(pwd)"
		;;

		QuienEsta)
			echo "$(who)"
		;;
	
		Salir)
			exit 0
	esac
done
