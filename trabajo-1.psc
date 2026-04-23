Algoritmo Biblioteca
	Definir Nombre, Contra, VerificarContra, Usuario, P_Usuario, titulos, autores, busqueda como cadena
	Definir TotalUsuarios, deuda, deuda_total, j, i, total, opcion_inicio, opcion_busqueda, prestamo, prestamo_calculo como entero
	Definir estado, disponible Como Logico
	
	Dimension Usuario[100]
	Dimension prestamo[100]	
	Dimension titulos[100]
	Dimension autores[100]
	Dimension disponible[100]
	Dimension P_Usuario[100]
	
	Usuario[1] <- "Luis Gallardo"
	Usuario[2] <- "Pablo Echeverria"
	Usuario[3] <- "Maxi Zurita"
	
	titulos[1] <- "Fisica Universitaria"
	autores[1] <- "Jewett"
	disponible[1] <- Falso
	prestamo[1] <- 15
	P_Usuario[1] <- "Maxi Zurita"
	titulos[2] <- "Fundamentos de Fisica"
	autores[2] <- "Walker"
	disponible[2] <- Verdadero
	prestamo[2] <- 0
	P_Usuario[2] <- ""
	titulos[3] <- "Fisica para Ciencias e Ingenieria"
	autores[3] <- "Mosca"
	disponible[3] <- Verdadero
	prestamo[3] <- 0
	P_Usuario[3] <- ""
	titulos[4] <- "Mecanica Vectorial para Ingenieros"
	autores[4] <- "Johnston"
	disponible[4] <- Falso
	prestamo[4] <- 3
	P_Usuario[4] <- "Pablo Echeverria"
	titulos[5] <- "Introduccion a la Mecanica Clasica"
	autores[5] <- "Morin"
	disponible[5] <- Verdadero
	prestamo[5] <- 0
	P_Usuario[5] <- ""
	titulos[6] <- "Earth"
	autores[6] <- "Thomas Jordan"
	disponible[6] <- Verdadero
	prestamo[6] <- 30
	P_Usuario[6] <- "Maxi Zurita"
	titulos[7] <- "Earth: An Introduction to Physical Geology"
	autores[7] <- "Lutgens"
	disponible[7] <- Verdadero
	prestamo[7] <- 0
	P_Usuario[7] <- ""
	titulos[8] <- "Principles of Igneous and Metamorphic Petrology"
	autores[8] <- "Winter"
	disponible[8] <- Falso
	P_Usuario[8] <- "Luis Gallardo"
	prestamo[8] <- 2
	titulos[9] <- "Structural Geology"
	autores[9] <- "Fossen"
	disponible[9] <- Verdadero
	prestamo[9] <- 0
	P_Usuario[9] <- ""
	titulos[10] <- "Applied Hydrogeology"
	autores[10] <- "Fetter"
	disponible[10] <- Verdadero
	prestamo[10] <- 0
	P_Usuario[10] <- ""
	
	Total <- 10
	TotalUsuarios <- 3
	
	Repetir
		Escribir ""
		Escribir "Elija la opcion que desea realizar"
		Escribir "1. Registro de libros"
		Escribir "2. Registro de usuarios"
		Escribir "3. Préstamo de libros"
		Escribir "4. Devolución de libros"
		Escribir "5. Cálculo de multa por atraso"
		Escribir "6. Búsqueda de libros por título o autor"
		Escribir "7. Listado de libros disponibles y no disponibles"
		Escribir "8. Generación de reporte"
		Escribir "9. Cerrar sistema"
		Leer opcion_inicio
		
		Segun opcion_inicio
	1:
		Repetir
			Escribir "Elija una opción"
			Escribir "1. Agregar Libro"
			Escribir "2. Salir"
			Leer opcion_busqueda 
			segun opcion_busqueda Hacer
				1:Escribir "Agregar Libro"
					
					Escribir "Titulo del libro"
					Leer titulos[total+1]
					
					
					Escribir "Autor del Libro, solo el apedillo del ultimo"
					Leer autores[total+1]
					
					disponible[total+1] <- Verdadero
					prestamo[total+1] <- 0
					
					Total = Total + 1
					
					Escribir "Libro registardo"
					Escribir "Libro: ", titulos[total] , " - Autor: " , autores[total]
					Escribir ""
					Esperar 2 segundos
				2: Escribir "Saliendo del registros de libro"
					
				De Otro Modo:
					Escribir ""
					Escribir "Opcion no valida"
					Escribir ""
			FinSegun
		Hasta Que opcion_busqueda = 2
	2:
		
		Repetir
			Escribir "Elija una opción"
			Escribir "1. Agregar Usuario"
			Escribir "2. Salir"
			Leer opcion_busqueda 	
			segun opcion_busqueda	
				1: 
					Escribir "Registro de usuario"
					Escribir "Ingrese nombre y apellido"
					Leer nombre
					
					TotalUsuarios <- TotalUsuarios + 1
					Usuario[TotalUsuarios] <- Nombre
					Escribir "Registro Valido"
					Esperar 2 segundos
				2:
					Escribir "Saliendo del registros de libro"
					
				De Otro Modo:
					Escribir ""
					Escribir "Opcion no valida"
					Escribir ""
			FinSegun
		Hasta Que opcion_busqueda = 2
		
	3: 			
		estado <- Falso
		estado_login_u <- Falso
		
		Escribir "Ingrese el nombre exacto del Libro"
		Leer busqueda
		
		
		Para i <- 1 Hasta Total Hacer
			Si titulos[i] = busqueda y disponible[i] = Verdadero
				Escribir "Libro Disponible"
				estado <- Verdadero
				Escribir "Ingrese Usuario"
				Leer login
				Para j <- 1 Hasta TotalUsuarios
					Si login = Usuario[j]
						disponible[i] = Falso
						estado_login_u <- Verdadero
						Escribir "Prestamo guardado"
						Esperar 2 segundos
					Fin si
				FinPara
			Finsi
		FinPara
		
		
		
		
		Si NO estado Entonces
			estado_login_u <- Verdadero
			Escribir "Libro no encontrado o en prestamo"
		FinSi
		
		Si NO estado_login_u Entonces
			estado_login <- Verdadero
			Escribir "Usuario no valido"
		FinSi
		
	4: 
		estado <- Falso
		
		Escribir "Ingrese el nombre exacto del libro a devolver"
		Leer busqueda
		
		
		Para i <- 1 Hasta Total Hacer
			Si titulos[i] = busqueda y disponible[i] = Falso
				Escribir "Libro disponible para devolucion"
				estado <- Verdadero
				Si prestamo[i] > 7
					Escribir "El libro posee una multa supera el maximo dias de prestamo"
					deuda = (prestamo[i] - 7)*20
					Escribir "La multa es de: $", deuda 
					prestamo[i] <- 0
					P_Usuario[i] <- ""
					disponible[i] <- Verdadero
					Esperar 2 segundos
				SINO 
					Escribir "El libro no posee multa"
				FinSi	
			Finsi
		FinPara
		
		
		Si estado = Falso Entonces
			Escribir "Introduzca bien el nombre del libro"
		FinSi
		
	5:
		Escribir "Elija una opción para el calculo de multa"
		Escribir "1. Calculo de multa segun dias"
		Escribir "2. Calculo de multa de libro prestado"
		leer opcion_busqueda
		
		deuda <- 0
		deuda_total <- 0
		
		segun opcion_busqueda Hacer
			1: escribir "Ingrese cantidad de dias de prestamo"
				Leer prestamo_calculo
				si prestamo_calculo < 7 Entonces
					Escribir "No posee deuda"
				sino 
					deuda <- (prestamo_calculo - 7)*20
					Escribir "La deuda calculada es de: $" , deuda 
				FinSi
			2: escribir "Ingrese Usuario a revisar (nombre y apellido)"
				leer busqueda
				deuda <- 0
				para i <- 1 hasta Total
					Si P_Usuario[i] = busqueda y prestamo[i] > 7
						Escribir ""
						deuda = (prestamo[i] - 7 )*20
						Escribir ""
						Escribir "Tiene una deuda de: $", deuda
						Escribir "Del libro: " , titulos[i]
						deuda_total = deuda_total + deuda
					FinSi
				FinPara
				Escribir ""
				Escribir "La deudal total es de: $" , deuda_total
				Esperar 2 segundos
			De Otro Modo:
				Escribir "Opcion no valida"
		FinSegun
	6:
		estado <- Falso
		
		Escribir "Elija una opción para el tipo de búsqueda"
		Escribir "1. Busqueda por nombre del libro"
		Escribir "2. Busqueda por autor del Libro"
		
		Leer opcion_busqueda 
		
		
		segun opcion_busqueda Hacer
			1: 	Escribir "Escriba el nombre del Libro exacto"
				Leer Busqueda
			2: 	Escribir "Escriba el el apellido del ultimo autor"
				Leer Busqueda
			De Otro Modo:
				Escribir "Opcion no valida"
				estado <- Verdadero
		FinSegun
		
		encontrado <- Falso
		
		Para i <- 1 hasta Total
			si opcion_busqueda = 1 Entonces
				
				si titulos[i] = Busqueda Entonces
					Escribir "Libro encontrado:"
					Escribir "Titulo: ", titulos[i]
					Escribir "Autor: ", autores[i]
					estado <- Verdadero
					Esperar 2 segundos
				FinSi
			FinSi
			Si opcion_busqueda = 2 Entonces
				
				si autores[i] = Busqueda Entonces
					Escribir "Libro encontrado:"
					Escribir "Titulo: ", titulos[i]
					Escribir "Autor: ", autores[i]
					estado <- Verdadero
					Esperar 2 segundos
				FinSi
			FinSi
		FinPara
		
		Si NO estado Entonces
			Escribir "No se encontraron resultados"
		FinSi
		
	7:
		Escribir "Listado de Libros"
		Escribir ""
		
		Escribir "Disponibles"
		Para i <- 1 Hasta total Hacer
			si disponible[i] Entonces
				Escribir titulos[i], " - ", autores[i]
			FinSi
		FinPara
		Esperar 2 segundos
		
		Escribir ""
		Escribir "No Disponibles"
		Para i <- 1 Hasta total Hacer
			si no disponible[i] Entonces
				Escribir titulos[i], " - ", autores[i]
			FinSi
		FinPara
		Esperar 3 segundos
		
	8:
		Escribir "Total de libros: " , Total
		Para i <- 1 hasta Total Hacer
			si disponible[i] = Verdadero
				disp = disp + 1
			Sino 
				nodisp = nodisp +1
			FinSi
		FinPara
		Escribir "Total de libros disponibles: " , disp
		Escribir "Total de libros no disponibles " , nodisp
		
		Escribir "Total de Usuarios: ", TotalUsuarios
		Esperar 3 segundos
		
	9:
		Escribir "Cerranndo el sistema"
		
		
	De Otro Modo:
		Escribir "Opcion no valida"
		Esperar 3 segundos
	fin segun

	Hasta Que opcion_inicio = 9
	
	
FinAlgoritmo
