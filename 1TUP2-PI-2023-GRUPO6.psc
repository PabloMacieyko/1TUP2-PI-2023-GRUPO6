Algoritmo TUP102GRUPO6
	//La Ferretería "El Tornillo Loco" cuenta con N artículos, de los cuales se conoce su código, descripción, precio de venta, cantidad
	//existente, cantidad vendida por quincena.
	//Al iniciarse el sistema se debe realizar la carga manual de artículos. El sistema debe pedirle al usuario que ingrese la cantidad de N
	//artículos que posee la ferretería y luego le pedirá al usuario que ingrese los datos de los mismos. El sistema va a procesar la información
	//por mes teniendo en cuenta lo vendido en cada una de las quincenas del mes.
	//Una vez finalizada ésta carga, mostrar la siguiente opción de menú que debe repetirse hasta tanto el usuario presione la opción para salir
		//1. Mostrar lista de artículos ordenada por descripción
		//2. Mostrar lista de artículos ordenada por cantidad vendida
		//3. Mostrar stock actual de artículos
		//4. Buscar artículo por código
		//5. Mostrar estadísticas
		//6. Salir
	
	Definir n, i, opc, resto, ventas como entero;
	definir lista,resto2,codigo Como Caracter;
	definir valido Como Logico;
	
	escribir "cuantos articulos hay a la venta?";
	leer n;
	
	Dimension lista[n,7];
	Dimension ventas[n];
	
	para i=0 hasta n-1 Hacer
		ventas[i]=0;
		escribir "datos del aiticulo ",i+1;
		escribir "ingrese el codigo del producto";
		Repetir
			leer lista[i,0];
			valido=validarcod(lista[i,0]);
			Mientras  Que !valido;
		escribir "ingrese la descripcion del producto";
		leer lista[i,1];
		escribir"ingrese el precio de venta del producto";
		leer lista[i,2];
		escribir"cantidad existente";
		leer lista[i,3];
		escribir "cantidad ventida en la primera quincena";
		leer lista[i,4];
		escribir "cantidad ventida en la segunda quincena";
		leer lista[i,5];
		resto2=cuantoqueda(lista,i);
		lista[i,6]=resto2;
		ventas[i]=ventasdelmes(lista,i);
	FinPara
	
	Repetir
		escribir "seleccione una opcion:";
		escribir "1. Mostrar lista de artículos ordenada por descripción";
		escribir "2. Mostrar lista de artículos ordenada por cantidad vendida";
		escribir "3. Mostrar stock actual de artículos";
		escribir "4. Buscar artículo por código";
		escribir "5. Mostrar estadísticas";
		escribir "6. Salir";
		leer opc;
		
		Segun opc Hacer
			//1:
			//	secuencia_de_acciones_1
			//2:
			//	secuencia_de_acciones_2
			3:
				para i=0 hasta n-1 Hacer
					escribir "codigo del producto: ",lista[i,0];
					escribir "descripcion: ",lista[i,1];
					escribir "Stock actual: ",lista[i,6];
					escribir " ";
				FinPara
			4:
				escribir "ingrese el codigo del producto";
				Repetir
					leer codigo;
					valido=validarcodigo(codigo);
					Mientras  Que !valido;
						
					para i=0 hasta n-1 hacer	
						si codigo=lista[i,0] Entonces
						escribir "descripcion: ",lista[i,1];
						escribir "ventas de la primera quincena: ",lista[i,4];
						escribir "ventas de la segunda quincena: ",lista[i,5];
						escribir "Stock actual: ",lista[i,6];
						escribir "el importe total es: ",ventas[i];
						FinSi
					FinPara
			
				
			//5:
			
			De Otro Modo:
				escribir"error, eliga nuevamente";
				leer opc;
		FinSegun
	Hasta Que opc=6

FinAlgoritmo

Funcion valido=validarcod(lista)
	definir valido Como Logico;
	definir cod como entero;
	cod<-ConvertirANumero(lista);
	si cod<>100 y cod<>300 y cod<>450 y cod<>680 y cod<>720 Entonces
		valido=Falso;
		escribir "error, ingresar el codigo nuevamente";
	sino 
		valido=verdadero;
	FinSi
FinFuncion

Funcion resto2=cuantoqueda(lista,i)
	definir resto,ex,PriQuin,SegQuin Como Entero;
	definir resto2 Como Caracter;
	ex<-ConvertirANumero(lista[i,3]);     //existente
	PriQuin<-ConvertirANumero(lista[i,4]);//primera quincena
	SegQuin<-ConvertirANumero(lista[i,5]);//segunda quincena
	resto=ex-PriQuin-SegQuin;
	resto2<-ConvertirATexto(resto);
FinFuncion

Funcion valido=validarcodigo(codigo)
	definir valido Como Logico;
	definir cod como entero;
	cod<-ConvertirANumero(codigo);
	si cod<>100 y cod<>300 y cod<>450 y cod<>680 y cod<>720 Entonces
		valido=Falso;
		escribir "error, ingresar el codigo nuevamente";
	sino 
		valido=verdadero;
	FinSi
FinFuncion

Funcion ventas=ventasdelmes(lista,i)
	definir ventas,PriQuin,SegQuin,precio Como Entero;
	precio<-ConvertirANumero(lista[i,2]);     
	PriQuin<-ConvertirANumero(lista[i,4]);
	SegQuin<-ConvertirANumero(lista[i,5]);
	ventas=(PriQuin+SegQuin)*precio;
FinFuncion

----------------------------------------------------

Algoritmo TUP102GRUPO6
	
	//La Ferretería "El Tornillo Loco" cuenta con N artículos, de los cuales se conoce su código, descripción, precio de venta, cantidad
	//existente, cantidad vendida por quincena.
	//Al iniciarse el sistema se debe realizar la carga manual de artículos. El sistema debe pedirle al usuario que ingrese la cantidad de N
	//artículos que posee la ferretería y luego le pedirá al usuario que ingrese los datos de los mismos. El sistema va a procesar la información
	//por mes teniendo en cuenta lo vendido en cada una de las quincenas del mes.
	//Una vez finalizada ésta carga, mostrar la siguiente opción de menú que debe repetirse hasta tanto el usuario presione la opción para salir
	//1. Mostrar lista de artículos ordenada por descripción
	//2. Mostrar lista de artículos ordenada por cantidad vendida
	//3. Mostrar stock actual de artículos
	//4. Buscar artículo por código
	//5. Mostrar estadísticas
	//6. Salir
	
	Definir n, i, opc, resto, ventas como entero;
	definir lista, resto2, codigo Como Caracter;
	definir valido Como Logico;
	
	escribir "Cuantos articulos hay a la venta?";
	leer n;
	
	Dimension lista[n,7];
	Dimension ventas[n];
	
	Para i = 0 hasta n - 1 Hacer
		ventas[i] = 0;
		escribir "Datos del artículo ", i+1;
		escribir "Ingrese el código del producto";
		Repetir
			leer lista[i,0];
			codigo <- lista [i,0];
			valido = validarcod(codigo);
			Mientras  Que !valido;
				escribir "Ingrese la descripción del producto";
				leer lista[i,1];
				escribir "Ingrese el precio de venta del producto";
				leer lista[i,2];
				escribir "Cantidad existente";
				leer lista[i,3];
				escribir "Cantidad vendida en la primera quincena";
				leer lista[i,4];
				escribir "Cantidad vendida en la segunda quincena";
				leer lista[i,5];
				resto2 = cuantoqueda(lista,i);
				lista[i,6] = resto2;
				ventas[i] = ventasdelmes(lista,i);
			FinPara
			
			Repetir
				escribir "Seleccione una opción:";
				escribir "1. Mostrar lista de artículos ordenada por descripción";
				escribir "2. Mostrar lista de artículos ordenada por cantidad vendida";
				escribir "3. Mostrar stock actual de artículos";
				escribir "4. Buscar artículo por código";
				escribir "5. Mostrar estadísticas";
				escribir "6. Salir";
				leer opc;
				
				Segun opc Hacer
					1:
						OrdenarArticulosPorDescripcion(lista, n);
					2:
						OrdenarArticulosPorCantidadVendida(lista, n);
					3:
						para i=0 hasta n-1 Hacer
							escribir "Codigo del producto: ",lista[i,0];
							escribir "Descripcion: ",lista[i,1];
							escribir "Stock actual: ",lista[i,6];
							escribir " ";
						FinPara
					4:
						escribir "Ingrese el codigo del producto";
						Repetir
							leer codigo;
							valido = validarcodigo(codigo);
							Mientras  Que !valido;
								
								para i = 0 hasta n - 1 hacer	
									si codigo = lista[i,0] Entonces
										escribir "Descripcion: ",lista[i,1];
										escribir "Ventas de la primera quincena: ", lista[i,4];
										escribir "Ventas de la segunda quincena: ", lista[i,5];
										escribir "Stock actual: ",lista[i,6];
										escribir "El importe total es: ", ventas[i];
									FinSi
								FinPara
								
								
							5:
								MostrarEstadisticas(lista, n);
								
							De Otro Modo:
								escribir "Error, elige nuevamente";
								leer opc;
						FinSegun
					Hasta Que opc = 6
					
FinAlgoritmo

Funcion valido = validarcod(codigo)
	
	Definir valido Como Logico;
	Definir rubro, numeroArticulo, codi Como Entero;
	
	codi <- convertiranumero(codigo);
	rubro <- trunc (codi / 100000);
	numeroArticulo <- trunc(codi % 100000);
	
	Si rubro <> 100 | rubro <> 300 | rubro <> 450 | rubro <> 680 | rubro <> 720 Entonces
		Si numeroArticulo >= 0 & numeroArticulo <= 99999 Entonces
			valido = Verdadero;
		SiNo
			valido = Falso;
		FinSi
	FinSi
	
FinFuncion

Funcion resto2 = cuantoqueda(lista,i)
	
	definir resto, ex, PriQuin, SegQuin Como Entero;
	definir resto2 Como Caracter;
	
	ex <- ConvertirANumero(lista[i,3]);         //existente
	PriQuin <- ConvertirANumero(lista[i,4]);    //primera quincena
	SegQuin <- ConvertirANumero(lista[i,5]);    //segunda quincena
	resto = ex - PriQuin - SegQuin;
	resto2 <- ConvertirATexto(resto);
	
FinFuncion

Funcion valido = validarcodigo(codigo)
	definir valido Como Logico;
	Definir rubro, numeroArticulo, codi Como Entero;
	
	codi <- convertiranumero(codigo);
	rubro <- trunc (codi / 100000);
	numeroArticulo <- trunc(codi % 100000);
	
	Si rubro <> 100 | rubro <> 300 | rubro <> 450 | rubro <> 680 | rubro <> 720 Entonces
		Si numeroArticulo >= 0 & numeroArticulo <= 99999 Entonces
			valido = Verdadero;
		SiNo
			valido = Falso;
			Escribir "Error reingrese el codigo";
		FinSi
	FinSi
	
FinFuncion

Funcion ventas = ventasdelmes(lista, i)
	
	Definir ventas, PriQuin, SegQuin, precio Como Entero;
	
	precio <- ConvertirANumero(lista[i,2]);     
	PriQuin <- ConvertirANumero(lista[i,4]);
	SegQuin <- ConvertirANumero(lista[i,5]);
	ventas = (PriQuin + SegQuin) * precio;
	
FinFuncion

SubProceso  OrdenarArticulosPorDescripcion(lista, n)
	
	Definir i, j, k, temp Como Entero;
	
    Para i <- 0 Hasta n - 2 Hacer
        Para j <- 0 Hasta n - i - 2 Hacer
            Si lista[j,1] > lista[j+1,1] Entonces
                Para k <- 0 Hasta 5 Hacer
                    temp <- lista[j,k];
                    lista[j,k] <- lista[j+1,k];
                    lista[j+1,k] <- temp;
                FinPara
            FinSi
        FinPara
    FinPara
	
    Escribir "Lista de artículos ordenada por descripción:";
    Para i <- 0 Hasta n - 1 Hacer
        Escribir "Código: ", lista[i,0];
        Escribir "Descripción: ", lista[i,1];
        Escribir "Precio de venta: ", lista[i,2];
        Escribir "Cantidad existente: ", lista[i,3];
        Escribir "Cantidad vendida 1ª quincena: ", lista[i,4];
        Escribir "Cantidad vendida 2ª quincena: ", lista[i,5];
    FinPara
	
FinSubProceso


SubProceso  OrdenarArticulosPorCantidadVendida(lista, n)
	
    Para i <- 0 Hasta n-2 Hacer
        Para j <- 0 Hasta n-i-2 Hacer
            totalVendido1 <- lista[j,4] + lista[j,5];
            totalVendido2 <- lista[j+1,4] + lista[j+1,5];
            Si totalVendido1 < totalVendido2 Entonces
                Para k <- 0 Hasta 5 Hacer
                    temp <- lista[j,k];
                    lista[j,k] <- lista[j+1,k];
                    lista[j+1,k] <- temp;
                FinPara
            FinSi
        FinPara
    FinPara
	
    Escribir "Lista de artículos ordenada por cantidad vendida:";
    Para i <- 0 Hasta n-1 Hacer
        Escribir "Código: ", lista[i,0];
        Escribir "Descripción: ", lista[i,1];
        Escribir "Precio de venta: ", lista[i,2];
        Escribir "Cantidad existente: ", lista[i,3];
        Escribir "Cantidad vendida 1ª quincena: ", lista[i,4];
        Escribir "Cantidad vendida 2ª quincena: ", lista[i,5];
    FinPara
	
FinSubProceso


Funcion MostrarEstadisticas(lista, n)
	
    Definir totalVentas, promedioVentas Como Real;
    totalVentas <- 0;
    Para i <- 0 Hasta n-1 Hacer
        totalVentas <- totalVentas + lista[i,4] + lista[i,5];
    FinPara
    promedioVentas <- totalVentas / (n * 2);
	
    Escribir "Estadísticas:";
    Escribir "Total de ventas: ", totalVentas;
    Escribir "Promedio de ventas mensual por artículo: ", promedioVentas;
	
FinFuncion
