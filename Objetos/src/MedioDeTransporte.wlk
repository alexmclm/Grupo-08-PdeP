import Localidad.*

class MedioDeTransporte {
	//constructor por que sera el precio de cada km de CADA TRANPOSTE que variara , idem para tiempoRecorrido
 	var property tiempoRecorrido
 	var property precioPorKm
 	var property velocidad // se asume que ahora los transporte tienen velocidad dado los perfiles
 	
 	constructor(unTiempo,unPrecio,unaVelocidad){
 		tiempoRecorrido = unTiempo
 		precioPorKm = unPrecio
 		velocidad = unaVelocidad 	
 		}
 	
 	method miVelocidad(){
 		return velocidad
 	}

}

class Avion inherits MedioDeTransporte{
	var property cantidadTurbinas
	var property nivelImpulsoPorTurbina //entendi esto, sumado a como pide el precioPorKM
	
	//creo que iria override del precioPorKM ya que se supone que cambia en base a su cantidad de turbinas y nivel
	override method precioPorKm(){
		return cantidadTurbinas * nivelImpulsoPorTurbina
	} 
}
class Micro inherits MedioDeTransporte{
	override method precioPorKm() = 5000
	
}
class Tren inherits MedioDeTransporte{
	var property millas
	override method precioPorKm(){
		return (millas * 1.60934)*2300
		
	}
}

class Barco inherits MedioDeTransporte{
	var property porcentajeDeChocar
	override method precioPorKm(){
		return (1000 * porcentajeDeChocar)
	}
}