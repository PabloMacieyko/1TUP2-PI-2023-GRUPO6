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




------------------------------------------------------------------------------------------





Algoritmo TUP102GRUPO6	
	definir cantidadArticulosALaVenta, i, opc como entero
	definir ventas como real;
	definir articulos como caracter;
	definir valores como real;
	definir valido como logico;
	
	escribir "Cuantos articulos hay a la venta?";
	leer cantidadArticulosALaVenta;
	
	Dimension articulos[cantidadArticulosALaVenta,2];
	Dimension valores[cantidadArticulosALaVenta, 6];
	
	Para i = 0 hasta cantidadArticulosALaVenta - 1 Hacer
		escribir "Datos del artículo ", i+1;
		escribir "Ingrese el código del producto";
		Repetir
			leer articulos[i,0];
			valido = validarCodigo(articulos [i,0]);
			
			Mientras  Que !valido;
				escribir "Ingrese la descripción del producto";
				leer articulos[i,1];
				escribir "Ingrese el precio de venta del producto";
				leer valores[i,0];
				escribir "Ingrese la cantidad existente";
				leer valores[i,1];
				escribir "Cantidad vendida en la primera quincena";
				leer valores[i,2];
				escribir "Cantidad vendida en la segunda quincena";
				leer valores[i,3];
				valores[i,4] = CalcularStock(valores,i);
				valores[i,5] = CalcularVentasDelMes(valores,i);
			FinPara
			
			Repetir
				escribir "Seleccione una opción:";
				escribir "1. Mostrar articulos de artículos ordenada por descripción";
				escribir "2. Mostrar articulos de artículos ordenada por cantidad vendida";
				escribir "3. Mostrar stock actual de artículos";
				escribir "4. Buscar artículo por código";
				escribir "5. Mostrar estadísticas";
				escribir "6. Salir";
				leer opc;
				
				Segun opc Hacer
					1:
						OrdenarArticulosPorDescripcion(articulos, valores, cantidadArticulosALaVenta);
					2:
						OrdenarArticulosPorCantidadVendida(articulos, valores, cantidadArticulosALaVenta);
					3:
						MostrarStock(articulos, valores, cantidadArticulosALaVenta);
					4:
						BuscarArticuloPorCodigo(articulos, valores, cantidadArticulosALaVenta);
					5:
						MostrarEstadisticas(articulos, valores, cantidadArticulosALaVenta);						
					De Otro Modo:
						escribir "Error, elige nuevamente";
				FinSegun
			Hasta Que opc = 6
			
FinAlgoritmo

Funcion resto = CalcularStock(valores,i)	
	Definir resto como Real;
	resto = valores[i,0] - valores[i,1] - valores[i,2];
FinFuncion

Funcion valido = validarCodigo(codigo)
	
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
	SiNo
		valido = falso;
	FinSi
	
FinFuncion



Funcion ventas = CalcularVentasDelMes(valores, i)
	
	Definir ventas, PriQuin, SegQuin, precio Como real;
	
	precio <- valores[i,0];     
	PriQuin <- valores[i,2];
	SegQuin <- valores[i,3];
	ventas = (PriQuin + SegQuin) * precio;
	
FinFuncion

SubProceso MostrarStock(articulos, valores, cantidadArticulosALaVenta)
	Definir i Como Entero;
	
	Para i=0 hasta cantidadArticulosALaVenta-1 Hacer
		escribir "Codigo del producto: ",articulos[i,0];
		escribir "Descripcion: ",articulos[i,1];
		escribir "Stock actual: ", valores[i,4];
		escribir " ";
	FinPara
	
FinSubProceso

SubProceso BuscarArticuloPorCodigo(articulos, valores, cantidadArticulosALaVenta)
	escribir "Ingrese el codigo del producto";
	
	definir encontrado como logico;
	encontrado <- falso;
	Repetir
		leer codigo;
		Mientras  Que !valido;
			para i = 0 hasta cantidadArticulosALaVenta - 1 hacer	
				si codigo = articulos[i,0] Entonces
					encontrado <- Verdadero;
					escribir "Descripcion: ",articulos[i,1];
					escribir "Ventas de la primera quincena: ", valores[i,2];
					escribir "Ventas de la segunda quincena: ", valores[i,3];
					escribir "Stock actual: ",valores[i,4];
					escribir "El importe total es: ", valores[i,5];
				FinSi
			FinPara
			si !encontrado Entonces
				escribir "No existe artículo con ese código.";
			FinSi
FinSubProceso

SubProceso  OrdenarArticulosPorDescripcion(articulos, valores, cantidadArticulosALaVenta)
	
	Definir i, j, k, posMenor como entero;
	Definir tempCodigo, tempDescripcion Como caracter;
	definir tempPrecio, tempStockInicial, tempVentasPrimeraQuincena, tempVentasSegundaQuincena, tempStockActual, tempVentas como Real;
	
    Para i <- 0 Hasta cantidadArticulosALaVenta - 2 Hacer
		posMenor <- i;
        Para j <- i+1 Hasta cantidadArticulosALaVenta - 1 Hacer
            Si articulos[j,1] > articulos[j,posMenor] Entonces
				posMenor <- j;
            FinSi
        FinPara
		tempCodigo <- articulos[i,0];
		tempDescripcion <- articulos[i, 1];
		tempPrecio <- valores[i, 0];
		tempStockInicial <- valores[i, 1];
		tempVentasPrimeraQuincena <- valores[i, 2];
		tempVentasSegundaQuincena <- valores[i, 3];
		tempStockActual <- valores[i, 4];
		tempVentas <- valores[i, 5];
		
		articulos[i,0] <- articulos[posMenor, 0];
		articulos[i,1] <- articulos[posMenor, 1];
		valores[i,0] <- valores[posMenor, 0];
		valores[i,1] <- valores[posMenor, 1];
		valores[i,2] <- valores[posMenor, 2];
		valores[i,3] <- valores[posMenor, 3];
		valores[i,4] <- valores[posMenor, 4];
		valores[i,5] <- valores[posMenor, 5];
		
		articulos[posMenor, 0] <- tempCodigo;		
		articulos[posMenor, 1] <- tempDescripcion;
		valores[posMenor, 0] <- tempPrecio;
		valores[posMenor, 1] <- tempStockInicial;
		valores[posMenor, 2] <- tempVentasPrimeraQuincena;
		valores[posMenor, 3] <- tempVentasSegundaQuincena;
		valores[posMenor, 4] <- tempStockActual;
		valores[posMenor, 5] <- tempVentas;
    FinPara
	
    Escribir "Articulos de artículos ordenada por descripción:";
    Para i <- 0 Hasta cantidadArticulosALaVenta - 1 Hacer
        Escribir "Código: ", articulos[i,0];
        Escribir "Descripción: ", articulos[i,1];
		Escribir "Precio Venta: ", valores[i,0];
    FinPara
	
FinSubProceso

SubProceso OrdenarArticulosPorCantidadVendida(articulos, valores, cantidadArticulosALaVenta)
	
	Definir i, j, k, posMenor como entero;
	Definir tempCodigo, tempDescripcion Como caracter;
	definir tempPrecio, tempStockInicial, tempVentasPrimeraQuincena, tempVentasSegundaQuincena, tempStockActual, tempVentas como Real;
	
    Para i <- 0 Hasta cantidadArticulosALaVenta - 2 Hacer
		posMenor <- i;
        Para j <- i+1 Hasta cantidadArticulosALaVenta - 1 Hacer
            Si valores[j,1] < valores[j, posMenor] Entonces
				posMenor <- j; 
            FinSi
        FinPara
		tempCodigo <- articulos[i,0];
		tempDescripcion <- articulos[i, 1];
		tempPrecio <- valores[i, 0];
		tempStockInicial <- valores[i, 1];
		tempVentasPrimeraQuincena <- valores[i, 2];
		tempVentasSegundaQuincena <- valores[i, 3];
		tempStockActual <- valores[i, 4];
		tempVentas <- valores[i, 5];
		
		articulos[i,0] <- articulos[posMenor, 0];
		articulos[i,1] <- articulos[posMenor, 1];
		valores[i,0] <- valores[posMenor, 0];
		valores[i,1] <- valores[posMenor, 1];
		valores[i,2] <- valores[posMenor, 2];
		valores[i,3] <- valores[posMenor, 3];
		valores[i,4] <- valores[posMenor, 4];
		valores[i,5] <- valores[posMenor, 5];
		
		articulos[posMenor, 0] <- tempCodigo;		
		articulos[posMenor, 1] <- tempDescripcion;
		valores[posMenor, 0] <- tempPrecio;
		valores[posMenor, 1] <- tempStockInicial;
		valores[posMenor, 2] <- tempVentasPrimeraQuincena;
		valores[posMenor, 3] <- tempVentasSegundaQuincena;
		valores[posMenor, 4] <- tempStockActual;
		valores[posMenor, 5] <- tempVentas;
    FinPara
	
	
    Escribir "Articulos de artículos ordenada por cantidad vendida:";
    Para i <- 0 Hasta cantidadArticulosALaVenta-1 Hacer
        Escribir "Código: ", articulos[i,0];
        Escribir "Descripción: ", articulos[i,1];
        Escribir "Cantidad total vendida en el mes: ", valores[i,5];
        Escribir "Importe total de la venta: ", valores[i,5] * valores[i,0];
    FinPara
FinSubProceso

Funcion rubroObtenido = ObtenerRubro(codigo) 
	
	rubroObtenido = ConvertirATexto(100);
FinSubProceso
SubProceso  MostrarEstadisticas(articulos, valores, cantidadArticulosALaVenta)	
	Definir i como Entero;
	Definir rubroActual como Caracter;
	Definir porcentajeVentasPorRubro como Real;
	Definir porcentajeVentaQuincena1PorRubro como Real;
	Definir porcentajeVentaQuincena2PorRubro como Real;
	Definir rubroMasVendido como Caracter;
	Definir cantidadRubros como Entero;	
	
	rubroActual <- ObtenerRubro(articulos[0, 0]) 
    Para i <- 0 Hasta cantidadArticulosALaVenta-1 Hacer
		Si rubroActual == ObtenerRubro(articulos[i, 0]) Entonces
			// TODO
		FinSi
	FinPara
		
FinSubProceso

