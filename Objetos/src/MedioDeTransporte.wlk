import Localidad.*

class MedioDeTransporte {
	//constructor por que sera el precio de cada km de CADA TRANPOSTE que variara , idem para tiempoRecorrido
 	var property tiempoRecorrido
 	var property precioPorKm
 	
 	constructor(unTiempo,unPrecio){
 		tiempoRecorrido = unTiempo
 		precioPorKm=unPrecio
 	}

}

class Aviones inherits MedioDeTransporte{
	var property cantidadTurbinas
	var property nivelImpulsoPorTurbina //entendi esto, sumado a como pide el precioPorKM
	
	//creo que iria override del precioPorKM ya que se supone que cambia en base a su cantidad de turbinas y nivel
	override method precioPorKm(){
		return cantidadTurbinas * nivelImpulsoPorTurbina
	} 
}
class Micros inherits MedioDeTransporte{
	override method precioPorKm() = 5000
	
}
class Trenes inherits MedioDeTransporte{
	var property millas
	override method precioPorKm(){
		return millas * 1.60934
		
	}
}