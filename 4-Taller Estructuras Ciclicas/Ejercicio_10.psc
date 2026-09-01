Proceso Ejercicio_10
	
	
		Definir num, contador Como Entero;
		Definir suma, promedio Como Real;
		suma <- 0;
		contador <- 0;
		Escribir "Ingrese un numero positivo (0 o negativo para terminar):";
		Leer num;
		Mientras num > 0 Hacer
			suma <- suma + num;
			contador <- contador + 1;
			Escribir "Ingrese otro numero positivo (0 o negativo para terminar):";
			Leer num;
		FinMientras
		Si contador > 0 Entonces
			promedio <- suma / contador;
			Escribir "Suma total de numeros positivos: ", suma;
			Escribir "Promedio de los numeros ingresados: ", promedio;
		Sino
			Escribir "No se ingresaron numeros positivos.";
		FinSi

FinProceso
