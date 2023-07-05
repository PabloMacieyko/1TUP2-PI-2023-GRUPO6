Algoritmo TUP102GRUPO6	
	Definir cantidadArticulosALaVenta, i, opc Como Entero;
	Definir ventas Como Real;
	Definir articulos Como Caracter;
	Definir valores Como Real;
	Definir valido Como Logico;
	
	Escribir "Cuantos articulos hay a la venta?";
	Leer cantidadArticulosALaVenta;
	
	Dimension articulos[cantidadArticulosALaVenta, 2];
	Dimension valores[cantidadArticulosALaVenta, 6];
	
	Para i = 0 hasta cantidadArticulosALaVenta - 1 Hacer
		Escribir "Datos del artículo ", i + 1;
		Escribir "Ingrese el código del producto";
		Repetir
			Leer articulos[i, 0];
			
			valido = validarCodigo(articulos [i, 0]);
			
			Mientras  Que !valido;
				Escribir "Ingrese la descripción del producto";
				Leer articulos[i, 1];
				Escribir "Ingrese el precio de venta del producto";
				Leer valores[i, 0];
				Escribir "Ingrese la cantidad existente";
				Leer valores[i, 1];
				Escribir "Cantidad vendida en la primera quincena";
				Leer valores[i, 2];
				Escribir "Cantidad vendida en la segunda quincena";
				Leer valores[i, 3];
				
				valores[i, 4] = CalcularStock(valores, i);
				valores[i, 5] = CalcularVentasDelMes(valores, i);
			FinPara
			
			Repetir
				Escribir "Seleccione una opción:";
				Escribir "1. Mostrar articulos de artículos ordenada por descripción";
				Escribir "2. Mostrar articulos de artículos ordenada por cantidad vendida";
				Escribir "3. Mostrar stock actual de artículos";
				Escribir "4. Buscar artículo por código";
				Escribir "5. Mostrar estadísticas";
				Escribir "6. Salir";
				Leer opc;
				
				Si opc <> 6 Entonces
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
							Escribir "Error, elige nuevamente";
					FinSegun
				FinSi
			Hasta Que opc = 6;
			
FinAlgoritmo

SubProceso MostrarStock(articulos, valores, cantidadArticulosALaVenta)
	Definir i Como Entero;
	
	Para i = 0 hasta cantidadArticulosALaVenta - 1 Hacer
		Escribir "Codigo del producto: ", articulos[i,0];
		Escribir "Descripcion: ", articulos[i,1];
		Escribir "Stock actual: ", valores[i,4];
		Escribir " ";
	FinPara
	
FinSubProceso

Funcion resto = CalcularStock(valores,i)	
	Definir resto como Real;
	resto = valores[i,1] - valores[i,2] - valores[i,3]; //cambie aqui, antes era: valores[i,0] - valores[i,1] - valores[i,2]
FinFuncion

Funcion valido = validarCodigo(codigo)
	
	Definir valido Como Logico;
	Definir rubro, codi Como Entero;
	
	codi <- convertiranumero(codigo);
	rubro <- trunc (codi / 100000);
	
	Si rubro <> 100 y rubro <> 300 y rubro <> 450 y rubro <> 680 y rubro <> 720 o codi <= 9999999 Entonces
		valido = falso;
		escribir "Error, ingresar el codigo nuevamente";
	SiNo
		valido = verdadero;
	FinSi
	
FinFuncion

Funcion ventas = CalcularVentasDelMes(valores, i)
	
	Definir ventas, PriQuin, SegQuin, precio Como real;
	
	precio <- valores[i,0];     
	PriQuin <- valores[i,2];
	SegQuin <- valores[i,3];
	ventas = (PriQuin + SegQuin) * precio;
	
FinFuncion

SubProceso OrdenarArticulosPorDescripcion(articulos, valores, cantidadArticulosAlaVenta)
	
	Definir i, j, posMenor Como Entero;
	Definir tempCodigo, tempDescripcion Como Caracter;
	Definir tempPrecio, tempStockInicial, tempVentasPrimeraQuincena, tempVentasSegundaQuincena, tempStockActual, tempVentas como Real;
	
    Para i <- 0 Hasta cantidadArticulosALaVenta - 2 Hacer
		posMenor <- i;
        Para j <- i + 1 Hasta cantidadArticulosALaVenta - 1 Hacer
            Si articulos[j, 1] < articulos[posMenor, 1] Entonces
				posMenor <- j;
			FinSi
		FinPara
		
		tempCodigo <- articulos[i, 0];
		tempDescripcion <- articulos[i, 1];
		tempPrecio <- valores[i, 0];
		tempStockInicial <- valores[i, 1];
		tempVentasPrimeraQuincena <- valores[i, 2];
		tempVentasSegundaQuincena <- valores[i, 3];
		tempStockActual <- valores[i, 4];
		tempVentas <- valores[i, 5];
		
		articulos[i, 0] <- articulos[posMenor, 0];
		articulos[i, 1] <- articulos[posMenor, 1];
		valores[i, 0] <- valores[posMenor, 0];
		valores[i, 1] <- valores[posMenor, 1];
		valores[i, 2] <- valores[posMenor, 2];
		valores[i, 3] <- valores[posMenor, 3];
		valores[i, 4] <- valores[posMenor, 4];
		valores[i, 5] <- valores[posMenor, 5];
		
		articulos[posMenor, 0] <- tempCodigo;		
		articulos[posMenor, 1] <- tempDescripcion;
		valores[posMenor, 0] <- tempPrecio;
		valores[posMenor, 1] <- tempStockInicial;
		valores[posMenor, 2] <- tempVentasPrimeraQuincena;
		valores[posMenor, 3] <- tempVentasSegundaQuincena;
		valores[posMenor, 4] <- tempStockActual;
		valores[posMenor, 5] <- tempVentas;
    FinPara
	
    Escribir "Lista de artículos ordenada por descripción:";
    Para i <- 0 Hasta cantidadArticulosALaVenta - 1 Hacer
        Escribir "Código: ", articulos[i, 0];
        Escribir "Descripción: ", articulos[i, 1];
		Escribir "Precio Venta: ", valores[i, 0];
    FinPara
FinSubProceso

SubProceso OrdenarArticulosPorCantidadVendida(articulos, valores, cantidadArticulosALaVenta)
	
	Definir i, j, k, posMenor Como Entero;
	Definir tempCodigo, tempDescripcion Como Caracter;
	Definir tempPrecio, tempStockInicial, tempVentasPrimeraQuincena, tempVentasSegundaQuincena, tempStockActual, tempVentas Como Real;
	
	Para i <- 0 Hasta cantidadArticulosALaVenta - 2 Hacer
		posMenor <- i;
        Para j <- i + 1 Hasta cantidadArticulosALaVenta - 1 Hacer
            Si valores[j, 4] > valores[posMenor, 4] Entonces
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
		
		articulos[i, 0] <- articulos[posMenor, 0];
		articulos[i, 1] <- articulos[posMenor, 1];
		valores[i, 0] <- valores[posMenor, 0];
		valores[i, 1] <- valores[posMenor, 1];
		valores[i, 2] <- valores[posMenor, 2];
		valores[i, 3] <- valores[posMenor, 3];
		valores[i, 4] <- valores[posMenor, 4];
		valores[i, 5] <- valores[posMenor, 5];
		
		articulos[posMenor, 0] <- tempCodigo;		
		articulos[posMenor, 1] <- tempDescripcion;
		valores[posMenor, 0] <- tempPrecio;
		valores[posMenor, 1] <- tempStockInicial;
		valores[posMenor, 2] <- tempVentasPrimeraQuincena;
		valores[posMenor, 3] <- tempVentasSegundaQuincena;
		valores[posMenor, 4] <- tempStockActual;
		valores[posMenor, 5] <- tempVentas;
		
    FinPara
	
    Escribir "Lista de artículos ordenada por cantidad vendida:";
    Para i <- 0 Hasta cantidadArticulosALaVenta - 1 Hacer
        Escribir "Código: ", articulos[i, 0];
        Escribir "Descripción: ", articulos[i, 1];
        Escribir "Cantidad total vendida en el mes: ", valores[i, 4];
        Escribir "Importe total de la venta: ", valores[i, 0] * valores[i, 4];
    FinPara
	
FinSubProceso

SubProceso BuscarArticuloPorCodigo(articulos, valores, cantidadArticulosALaVenta)
	Definir codigo, codArray, i Como Entero;
	Definir encontrado Como Logico;
	
	Escribir "Ingrese el codigo del producto";
	Repetir
		Leer codigo;
		encontrado = Falso;
		Para i = 0 Hasta cantidadArticulosALaVenta - 1 Hacer	
			codArray <- ConvertirANumero(articulos[i, 0]);
			Si codigo = codArray Entonces
				encontrado <- Verdadero;
				Escribir "Descripcion: ", articulos[i, 1];
				Escribir "Ventas de la primera quincena: ", valores[i, 2];
				Escribir "Ventas de la segunda quincena: ", valores[i, 3];
				Escribir "Stock actual: ", valores[i, 4];
				Escribir "El importe total es: ", valores[i, 5];
			FinSi
		FinPara
		Si codigo <> codArray Entonces
			Escribir "No existe artículo con ese código.";
		FinSi
	Mientras  Que !encontrado;
FinSubProceso

SubProceso  MostrarEstadisticas(articulos, valores, cantidadArticulosALaVenta)	
	Definir rubro, codi, porcentaje100, porcentaje300, porcentaje450, porcentaje680, porcentaje720, cantidadTotalVentas, quincena100, quincena300, quincena450, quincena680, quincena720 Como real;
	definir i Como Entero;
	porcentaje100 = 0; 
	porcentaje300 = 0;
	porcentaje450 = 0;
	porcentaje680 = 0;
	porcentaje720 = 0;
	quincena100 = 0;
	quincena300 = 0;
	quincena450 = 0;
	quincena680 = 0;
	quincena720 = 0;
	cantidadTotalVentas = 0;
	
	Para i = 0 Hasta cantidadArticulosALaVenta - 1 Hacer
		cantidadTotalVentas = cantidadTotalVentas + valores[i,2] + valores[i,3];
	FinPara
	
	Para i = 0 Hasta cantidadArticulosALaVenta - 1 Hacer
		codi <- ConvertirANumero(articulos[i, 0]);  
		rubro <- trunc (codi / 100000);	
		
		Si rubro = 100 Entonces
			porcentaje100 = porcentaje100 + (valores[i, 2] + valores[i, 3]) / (cantidadTotalVentas / 100);
			quincena100 = quincena100 + (valores[i, 2] / (valores[i, 2] + valores[i, 3]));
		FinSi
		Si rubro = 300 Entonces
			porcentaje300 = porcentaje300 + (valores[i, 2] + valores[i, 3]) / (cantidadTotalVentas / 100);
			quincena300 = quincena300 + (valores[i, 2] / (valores[i, 2]+valores[i, 3]));
		FinSi
		Si rubro = 450 Entonces
			porcentaje450 = porcentaje450 + (valores[i, 2] + valores[i, 3]) / (cantidadTotalVentas / 100);
			quincena450 = quincena450 + (valores[i, 2] / (valores[i, 2] + valores[i, 3]));
		FinSi
		Si rubro=680 Entonces
			porcentaje680 = porcentaje680 + (valores[i, 2]+valores[i, 3]) / (cantidadTotalVentas / 100);
			quincena680 = quincena680 + (valores[i, 2] / (valores[i, 2] + valores[i, 3]));
		FinSi
		Si rubro = 720 Entonces
			porcentaje720 = porcentaje720 + (valores[i, 2] + valores[i, 3]) / (cantidadTotalVentas / 100);
			quincena720 = quincena720 + (valores[i, 2] / (valores[i, 2] + valores[i, 3]));
		FinSi
		
	FinPara
	
	Escribir "a) Porcentaje de la cantidad de artículos vendidos de cada rubro:";
	Escribir " Para el rubro 100: ", porcentaje100;
	Escribir " Para el rubro 300: ", porcentaje300;
	Escribir " Para el rubro 450: ", porcentaje450;
	Escribir " Para el rubro 680: ", porcentaje680;
	Escribir " Para el rubro 720: ", porcentaje720;
	Escribir " ";
	Escribir "b) Porcentaje de venta de cada quincena por Rubro sobre el total del mes ";
	Escribir " Para el rubro 100: la primera quincena ", quincena100 * 100,"% y en la segunda quincena ", (1-quincena100) * 100,"%";
	Escribir " Para el rubro 300: la primera quincena ", quincena300 * 100,"% y en la segunda quincena ", (1-quincena300) * 100,"%";
	Escribir " Para el rubro 450: la primera quincena ", quincena450 * 100,"% y en la segunda quincena ", (1-quincena450) * 100,"%";
	Escribir " Para el rubro 680: la primera quincena ", quincena680 * 100,"% y en la segunda quincena ", (1-quincena680) * 100,"%";
	Escribir " Para el rubro 720: la primera quincena ", quincena720 * 100,"% y en la segunda quincena ", (1-quincena720) * 100,"%";
	Escribir " ";
	Escribir "c) Rubro con mayor importe total de ventas en cada quincena"; 
	Si quincena720 > quincena680 y quincena720 > quincena450 y quincena720 > quincena300 y quincena720 > quincena100 Entonces
		Escribir "El rubro 720";
	FinSi
	Si quincena680 > quincena450 y quincena680 > quincena300 y quincena680 > quincena100 Entonces
		Escribir "El rubro 680";
	FinSi
	Si quincena450 > quincena300 y quincena450 > quincena100 Entonces
		Escribir "El rubro 450";
	FinSi
	Si quincena300 > quincena100 Entonces
		Escribir "El rubro 300";
	SiNo
		Escribir "El rubro 100";
	FinSi
FinSubProceso
