Proceso Ejercicio_9
	
	
		Definir numeroSecreto, intento, numUsuario Como Entero;
		Definir adivino Como Logico;
		numeroSecreto <- 7;
		adivino <- Falso;
		intento <- 1;
		Mientras intento <= 3 Y NO adivino Hacer
			Escribir "Intento ", intento, " de 3. Ingrese un numero (1 a 10):";
			Leer numUsuario;
			Si numUsuario = numeroSecreto Entonces
				adivino <- Verdadero;
			Sino
				Escribir "Numero incorrecto.";
			FinSi
			intento <- intento + 1;
		FinMientras
		Si adivino Entonces
			Escribir "Felicidades, adivinaste el numero!";
		Sino
			Escribir "Fallaste. Te quedaste sin intentos. El numero era: ", numeroSecreto;
		FinSi
	
FinProceso
