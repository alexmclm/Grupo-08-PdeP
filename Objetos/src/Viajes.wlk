import Usuario.*
import Localidades.*
import MediosDeTransporte.*
class Viaje {
	//aca iria todo el tema de los medios de transporte para cada viaje de cada usuario
	//es muy dificil de plantearlo, pero hare e intento

/*el precio del viaje sera por la cantidad de kilometros que recorrera en 
 * ese transporte(la diferencia de distancia entre una localidad y otra)
 * * el precio por cada Km recorrido que tiene el transporte (de MEDIO DE TRANSPORTE)
 * (al menos quiero creer que es asi)
 */
	var property destinoOrigen
	var property destinoFinal
	var property transporte
	constructor (unDestinoOrigen,unDestinoFinal,unTransporte){
		destinoOrigen = unDestinoOrigen
		destinoFinal = unDestinoFinal
		transporte = unTransporte	
			}
			//lo llamo para no hacer de nuevo la cuenta, ya que de la "localidad" sabe cuanto es la distancia
			//"misma funcion que 'localidad'.distanciaCon(unDestino)" 
	method distanciaARecorrer(){
		return destinoOrigen.distanciaCon(destinoFinal)
	}
			
	method precioViaje(){
		return  (transporte.precioPorKm() * self.distanciaARecorrer()) + destinoFinal.precio() 
	}
}
