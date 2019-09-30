class Localidades {
	var nombre
	var equipaje = []
	var precio
	var ubicacionEnKm
	constructor (unNombre,unosEquipajes,unPrecio,unaUbicacionEnKm){
		nombre = unNombre
		equipaje = unosEquipajes
		precio = unPrecio
		ubicacionEnKm = unaUbicacionEnKm
	}
	method precio() = precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esDestacado(){
		return precio > 2000
	}
	method precioConDescuento(unDescuento){
		precio -= self.descuentoDel(unDescuento)	
		self.agregarAlEquipaje("Certificado De Descuento")		
	}
	method descuentoDel(unDescuento){
		return (precio*unDescuento)/100
	}
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}
	
	method esPeligroso(){
		return equipaje.any({unEquipaje => unEquipaje.contains("Vacuna")})
	}
	
	method nombre()=nombre
	method equipaje() = equipaje
	
	//Las localidades deberán saber en qué kilómetro se ubican y deberán poder calcular la distancia a otra localidad.
		
	method distanciasCon(distanciaDestino){
		return (ubicacionEnKm - distanciaDestino)
	}
	

}
