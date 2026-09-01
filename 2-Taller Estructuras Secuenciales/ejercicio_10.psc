Proceso ejercicio_10
	
		Definir horasTrabajadas, precioHora, salarioBruto, descuento, salarioNeto Como Real;
		Escribir "Ingrese las horas trabajadas:";
		Leer horasTrabajadas;
		Escribir "Ingrese el precio por hora:";
		Leer precioHora;
		salarioBruto <- horasTrabajadas * precioHora;
		descuento <- salarioBruto * 0.08;
		salarioNeto <- salarioBruto - descuento;
		Escribir "Salario bruto: $", salarioBruto;
		Escribir "Descuento (8%): $", descuento;
		Escribir "Salario neto a recibir: $", salarioNeto;
FinProceso
	

