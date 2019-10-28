class Localidad {
	
	var property nombre
	var property equipaje = []
	var property precio
	var property ubicacionEnKm
	constructor (unNombre,unosEquipajes,unPrecio,unaUbicacionEnKm){
		nombre = unNombre
		equipaje = unosEquipajes
		precio = unPrecio
		ubicacionEnKm = unaUbicacionEnKm
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
	//seria mas entendible si se llama esPeligrosoPara(unUsuario)
	method esPeligroso(){
		return equipaje.any({unEquipaje => unEquipaje.contains("Vacuna")})
	}
	
	method nombre()=nombre
	method equipaje() = equipaje
	
	//Las localidades deberán saber en qué kilómetro se ubican y deberán poder calcular la distancia a otra localidad.
		
	method distanciasCon(distanciaDestino){
		return (self.ubicacionEnKm() - distanciaDestino.ubicacionEnKm()).abs()
	}	

}
class Playa inherits Localidad{
	
	override method esPeligroso() = false
	
}
class Montanias inherits Localidad{
	var property altura
	
	override method esPeligroso(){
		return altura > 5000
	}
	override method esDestacado() = true
}
class CuidadHistorica inherits Localidad{
	var property museos = #{} // ya que si o si las cuidades historica deben contar con al menos 3 museos

	override method esPeligroso(){
		//re - defino esta funcion ya que en ningun momento alardea que el viajero deba tener el seguro de asistencia 
		//sino, es mas de parte de las localidades en el que si o si su equipaje deba tener ese seguro
		return self.equipaje().contains("seguro de asistencia al viajero")
	}
	override method esDestacado(){
		//no se si esta bien hecho, pero dice que aparte de cumplir el requisito de todo destino de tener un precio mayor a $2000
		return museos.size() > 3 && self.precio()>2000
	}
	method agregarMuseos(unosMuseos){
		museos.add(unosMuseos)
	}
}
