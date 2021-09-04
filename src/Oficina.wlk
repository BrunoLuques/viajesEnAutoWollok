/*
Oficina de la cooperativa:
Agregar al modelo un objeto que represente a la oficina desde la que 
la cooperativa despacha viajes.

En este modelo simplificado, cuando la oficina recibe un viaje, 
hay dos remiseras que pueden tomarlo:
- uno que tiene prioridad (primera remisera) 
- otro que es la segunda opción (o segunda remisera).

El objeto oficina debe entender estos mensajes: 

- asignarRemiseras(remisera1, remisera2): 
establece las remiseras de primera y de segunda opción. 

- cambiarPrimerRemiserarPor(remisera): 
cambia la remisera de primera opción por el que se indica. 
 
- cambiarSegundoRemiseraPor(remisera): 
cambia la remisera de segunda opción por el que se indica. 
 
- intercambiarRemiseras(): 
intercambia las remiseras de primera y segunda opción. 
O sea, la que era primera pasa a segunda, y viceversa. 

- remiseraElegidaParaViaje(cliente, kms): 
devuelve la remisera que corresponde asignar a un viaje, 
dados el cliente y la cantidad de kilómetros. 
 
El criterio es el siguiente: 
si para ese viaje, el precio de la segunda remisera es menor al de la 
primera con una diferencia de más de 30 pesos, entonces se elige 
la segunda remisera; si no, se elige la primera.

Supongamos que en un momento dado la remisera de primera opción es Roxana, 
y el de segunda opción es Juana. En este caso:

- para un viaje de 10 kilómetros para Ana María, la remisera elegida es 
Juana, porque su precio de 200 pesos, es menor al de Roxana (300 pesos), 
y la diferencia es de más de 30 pesos. 

- si el viaje es para Teresa, entonces Roxana ofrece 220 pesos y Juana 200.
El precio de Juana es menor, pero la diferencia no llega a 30 pesos.
Por lo tanto, la remisera elegido es Roxana. 
 
- si el viaje es de 4 kilómetros para Teresa, entonces Roxana cobra 
88 pesos y Juana 100. 
El precio de Roxana es menor, por lo tanto Roxana es la elegida.
 */
 
import remiseras.*
import Clientas.*

object oficina {
	var primeraRemisera
	var segundaRemisera
	
	method asignarRemiseras(remisera1, remisera2){
		primeraRemisera = remisera1
		segundaRemisera = remisera2
	}
	
	method cambiarPrimeraRemiserarPor(remisera){
		primeraRemisera = remisera
	}
	
	method cambiarSegundaRemiseraPor(remisera){
		segundaRemisera = remisera
	}
	
	method intercambiarRemiseras(){
		const record = primeraRemisera
		
		self.cambiarPrimeraRemiserarPor(segundaRemisera)
		self.cambiarSegundaRemiseraPor(record)
	}
	
	method remiseraElegidaParaViaje(cliente, kms){
		return
			if(primeraRemisera.precioDelViaje(cliente, kms) > segundaRemisera.precioDelViaje(cliente, kms)
				and (primeraRemisera.precioDelViaje(cliente, kms) - segundaRemisera.precioDelViaje(cliente, kms)) > 30)
				{segundaRemisera}
			else {primeraRemisera}
		
	}
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
