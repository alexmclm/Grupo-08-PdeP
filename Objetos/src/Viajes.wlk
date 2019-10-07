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
	var property localidadOrigen
	var property localidadFinal
	var property transporte
	constructor (unlocalidadOrigen,unlocalidadFinal,unTransporte){
		localidadOrigen = unlocalidadOrigen
		localidadFinal = unlocalidadFinal
		transporte = unTransporte	
			}
			//lo llamo para no hacer de nuevo la cuenta, ya que de la "localidad" sabe cuanto es la distancia
			//"misma funcion que 'localidad'.distanciaCon(unDestino)" 
	method distanciaARecorrer(){
		return localidadOrigen.distanciaCon(localidadFinal)
	}
			
	method precioViaje(){
		return  (transporte.precioPorKm() * self.distanciaARecorrer()) + localidadFinal.precio() 
	}
}
