/*
Clientes
Estos son los valores que arregló con algunos clientes:

- Ludmila: 18 pesos el kilómetro, valor fijo e inamovible.

- Ana María: 30 pesos el kilómetro si está económicamente estable, 
25 pesos el kilómetro en caso contrario. 
Se sabe en cada momento si Ana María está o no económicamente estable.

- Teresa: arranca en 22 pesos el kilómetro, puede cambiar a cualquier 
otro valor. 
*/

object ludmila {
	
	method precioPorKilometro(){return 18}
}

object anaMaria {
		
	method estaEstable(){return true}
	method precioPorKilometro(){return if (self.estaEstable()) 30 else 25}
}

object teresa{
	const precioKmPactado = 22
	
	method precioPorKilometro(){return precioKmPactado}
}


	
	
	
	
	
	
	
	
	