Proceso Ejercicio_7
	

		Escribir "Ingrese la temperatura del agua (°C): ";
		Leer temp;
		
		Si temp < 0 Entonces
			Escribir "Estado sólido";
		Sino
			Si temp < 100 Entonces
				Escribir "Estado líquido";
			Sino
				Escribir "Estado gas";
			FinSi
		FinSi
FinAlgoritmo
