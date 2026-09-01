Proceso EJERCICIO_10
    // Declaración de variables
    Definir horas, horas_normales, horas_extras Como Entero;
    Definir precio_hora, sueldo_bruto_semanal, sueldo_mensual, porcentaje_impuesto, impuesto_semanal, sueldo_neto_semanal Como Real;
	
    Escribir "Ingrese las horas trabajadas en la semana:";
    Leer horas;
    
    Escribir "Ingrese el precio por hora:";
    Leer precio_hora;
		
		// Cálculo del sueldo bruto semanal con horas extras
		Si horas <= 35 Entonces
			sueldo_bruto_semanal <- horas * precio_hora;
		Sino
			horas_normales <- 35;
			horas_extras <- horas - 35;
			sueldo_bruto_semanal <- (horas_normales * precio_hora) + (horas_extras * precio_hora * 1.25);
		FinSi
		
		// Impuesto sobre sueldo mensual (4 semanas)
		sueldo_mensual <- sueldo_bruto_semanal * 4;
		
		Si sueldo_mensual < 1000 Entonces
			porcentaje_impuesto <- 0.0;
		Sino
			Si sueldo_mensual <= 2000 Entonces
				porcentaje_impuesto <- 0.20;
			Sino
				porcentaje_impuesto <- 0.30;
			FinSi
		FinSi
		
		impuesto_semanal <- sueldo_bruto_semanal * porcentaje_impuesto;
		sueldo_neto_semanal <- sueldo_bruto_semanal - impuesto_semanal;
		
		Escribir "Sueldo bruto semanal: ", sueldo_bruto_semanal;
		Escribir "Impuestos deducidos: ", impuesto_semanal;
		Escribir "Sueldo neto semanal: ", sueldo_neto_semanal;

	
FinProceso
