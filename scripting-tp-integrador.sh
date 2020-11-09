# Menu
function muestra_menu() 
{
echo "[1] Mostrar la cantidad de elementos de la sucesion fibonacci para un numero"
echo "[2] Pedir numero entero y mostrar por pantalla el numero de forma invertida"
echo "[3] Pedir una cadena de caracteres y evaluar si es palindromo o no"
echo "[4] Pedir el path a un archivo de texto y mostrar por pantalla la cantidad de lineas que tiene"
echo "[5] Pedir 5 numeros enteros y mostrarlos por pantalla en forma ordenada"
echo "[6] Pedir el path a un directorio y mostrar por pantalla cuantos archivos de cada tipo contiene (No se tiene en cuenta ./ y ../)"
echo "[7] Salir" 
}

op=0

while true; do
	muestra_menu
	echo
	read -p "Ingrese una opcion: " op
	case $op in 
		1) read -p "Ingrese numero:" num
       	           if [[ $num =~ ^-?[0-9]+$ ]]; then
		   	a=0
		   	b=1
		   	echo -e "El numero serie Fibonacci de $num es: "
		   	for ((i=0;i<=num;i++))
		   		do 
				echo -n "$a,"
				fn=$((a + b))
				a=$b
				b=$fn
		   	done
		   echo 
		   else
		   	echo "El valor ingresado no es un numero entero"
		   fi;;
		2) read -p "Ingrese numero:" num
		   if [[ $num =~ ^-?[0-9]+$ ]]; then
                   	echo $num | rev
                   else
                   	echo "El valor ingresado no es un numero entero"
                   fi;;			
		3) read -p "Ingrese una cadena de caracteres: " cad
		   if [[ $(rev <<< "$cad") ==  "$cad" ]]; then	
 			echo "La cadena de caracteres es palindromo"
		   else 
			echo "La cadena de caracteres no es palindromo"
		   fi;;
		4) read -p "Ingrese path de archivo de texto: " path
		   if [ -f $path ]; then 
			echo "Cantidad de lineas: $(cat $path | wc -l)"
		   else 
		   	echo "No existe el fichero"
		   fi;;
		5) declare -a vec
		   for ((i=0;i<5;i++))
			do
			read -p "Ingrese numero: " num
			until [[ $num =~ ^-?[0-9]+$ ]]; do
				echo "El valor ingresado no es entero"
				read -p "Ingrese el $i numero: " num
			done
			vec[i]=$num
		   done
		   echo -e "\nArray original: "
		   echo -e "${vec[*]}"
		   IFS=$'\n' sorted=($(sort <<< "${vec[*]}"))
	           unset IFS
		   echo -e "\nArray ordenado:"
		   printf "%s " "${sorted[@]}";;	
		6) read -p "Ingrese path de directorio: " path
		   if [ -d $path ]; then
			find $path -type f | sed -n 's/..*\.//p' | sort | uniq -c
		   else
			echo "No existe el directorio"
		   fi;;
		7) echo -e "Gracias por usar el programa \e[1;31m$(id -u -n)\e[0m, nos vemos pronto"
	           exit;;
		*) echo "Opcion ingresada incorrecta";;
	esac
done 
exit 0
