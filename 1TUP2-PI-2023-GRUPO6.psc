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
	