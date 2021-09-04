/*
Remiseras:
A partir de estos valores, cada remisera tiene un margen de decisión 
sobre cuánto cobrar un viaje. 
En particular:

- Roxana le cobra a cada cliente el precio por kilómetro que pactó con 
la cooperativa sin variaciones.

- Gabriela le aumenta un 20%, porque su auto de alta gama. 

- Mariela no aplica recargo, pero establece un mínimo de 50 pesos el viaje.

- Juana por su parte, cobra 100 pesos hasta 8 kilómetros, y 
200 pesos si son más de 8 kilómetros. 
A Juana no le importa lo que pactó la agencia, le cobra lo mismo a todos.

Veamos cuánto cobra cada remisera un viaje de 10 kilómetros. 
En lo que sigue, se supone que Ana María está económicamente estable,
y que no se cambió el valor pactado con Teresa.

Roxana: a Ludmila 180 pesos (18 * 10), a Ana María 300, a Teresa 220.

Gabriela: a Ludmila 216 pesos (180 * 1.2), a Ana María 360, a Teresa 264.

Mariela: lo mismo que Roxana.

Juana: 200 pesos a todos.

Si el viaje es de 2 kilómetros, los valores son estos:

Roxana: a Ludmila 36 pesos (18 * 2), a Ana María 60, a Teresa 44.

Gabriela: a Ludmila 43.20 pesos (36 * 1.2), a Ana María 72, a Teresa 52.80.

Mariela: a Ludmila y a Teresa 50 pesos que es el mínimo, a Ana María 60.

Juana: 100 pesos a todos.

Se pide representar a las remiseras y a los clientes, de forma tal de poder 
preguntarle a una remisera cuánto le cobra a un determinado cliente por un viaje, 
del cual se indican los kilómetros. P.ej. roxana.precioViaje(ludmila,10) debe devolver 180.


Lucía y la cadete: Agregar al modelo a la remisera Lucía, y a la cliente Melina.
Lucía es una remisera que hace reemplazos, o sea, cubre los turnos que las otras remiseras 
se tienen que tomar por alguna razón. 
Hay que informar a quién está reeemplazando Lucía. 
Lucía cobra lo mismo que la remisera a la que está reemplazando.
--------------------------------------------------------------------------------------------------------------
Melina es una cadeta que trabaja para las otras clientas de la remisería. 
En cada momento trabaja para una clienta, se debe informar para quién. 
El precio por kilómetro pactado con Melina es 3 pesos menos que el precio de la clienta 
para quien esté trabajando en cada momento. 

* Ej. si Lucía está reemplazando a Mariela, y Melina está trabajando para Ludmila, entonces: 

- por un viaje de 10 kilómetros Lucía le cobra a Melina 150 pesos 
(el precio por kilómetro es 15, tres menos que lo que se pactó con Ludmila). 

- por un viaje de 1 kilómetro le va a cobrar 50 pesos, que es el mínimo que establece Mariela. 

Si en cambio Lucía está reemplazando a Gabriela, y manteniendo que Melina trabaja para Ludmila, 
entonces los valores para 10 y 1 km son 180 y 18, 
porque corre el 20% de recargo que establece Gabriela.
 */
 
 import Clientas.*
 
 object roxana {
 	 	
 	method precioDelViaje(cliente, kilometros){
 		return kilometros * cliente.precioPorKilometro()
 	} 
}
 
 object gabriela {
 	method precioDelViaje(cliente, kilometros){
 		return (kilometros * cliente.precioPorKilometro()) *1.2
 	}
 
}
 
 object mariela {
 	
 	method precioDelViaje(cliente, kilometros){
 		return 
 			if ((cliente.precioPorKilometro() * kilometros) < 50){50}
 			else {cliente.precioPorKilometro() * kilometros}
 	}
}

 object juana {
 	
 	method precioDelViaje(cliente, kilometros){
 		return
 			if (kilometros <= 8){100}
 			else 200
 		
 	}
}
 
 object lucia {
 	var titular 
 	
 	method reemplazaA(nombre) {titular = nombre}
 	method aQuienEstaReemplazando() {return titular}
 	
 	method precioDelViaje(cliente, kilometros) {
 		return titular.precioDelViaje(cliente, kilometros)
 	}
}
 
object melina {
	var clienta
	
	method trabajaPara(nombre) {clienta = nombre}
	method paraQuienTrabaja()  {return clienta}
		
	method precioPorKilometro() {
		return 
			clienta.precioPorKilometro() - 3
	}
}
 
 
 
 
 
 
 
 

