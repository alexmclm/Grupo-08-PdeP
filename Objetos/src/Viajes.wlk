import Usuario.*
import Localidades.*
class Viaje {
	//aca iria todo el tema de los medios de transporte para cada viaje de cada usuario
	//es muy dificil de plantearlo, pero hare e intento

/*el precio del viaje sera por la cantidad de kilometros que recorrera en 
 * ese transporte(la diferencia de distancia entre una localidad y otra)
 * + el precio del destino , sacado de LOCALIDADES.wlk
 * (al menos quiero creer que es asi)
 */
	method precioViaje(unDestino){
		return  unDestino.precio() + unDestino.precio()
	}
}
