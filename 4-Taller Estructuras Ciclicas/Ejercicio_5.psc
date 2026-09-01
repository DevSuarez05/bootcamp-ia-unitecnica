Proceso Ejercicio_5
	
	
		Definir i Como Entero;
		Definir horasDia, totalHoras, tarifa, totalPago Como Real;
		totalHoras <- 0;
		Escribir "Ingrese la tarifa de pago por hora extra:";
		Leer tarifa;
		Para i <- 1 Hasta 5 Con Paso 1 Hacer
			Escribir "Ingrese las horas extras del dia ", i, ":";
			Leer horasDia;
			totalHoras <- totalHoras + horasDia;
		FinPara
		totalPago <- totalHoras * tarifa;
		Escribir "El total de horas extras trabajadas es: ", totalHoras;
		Escribir "El valor total a pagar es: ", totalPago;
		
FinProceso
