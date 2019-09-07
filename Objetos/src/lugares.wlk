object garlicSea {
	var requiereVacuna = false //Asumimos que el destino es el que sabe si requiere o no vacuna. 
	var nombre = "Garlic Sea"
	var equipaje = #{"Caña de pescar", "Piloto"}
	var precio = 2500 // considero que si bien puede aplicarle todos los descuento que se le cante, debe tener una base y en base a la economia cambiara con set
	method precio() = precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esDestacado(){
		return precio > 2000
	}
	method precioConDescuento(unDescuento){
		precio -= self.descuentoDel(unDescuento)	
	}
	method descuentoDel(unDescuento){
		return (precio*unDescuento)/100
	}
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}
	
	method esPeligroso(){
		return requiereVacuna
	}
	
	method nombre()=nombre
	method equipaje() = equipaje	
}

object silversSea{
	var requiereVacuna = false //Asumimos que el destino es el que sabe si requiere o no vacuna.
	var nombre = "Silver´s Sea"
	var equipaje = #{"Protector Solar", "Equipo de Buceo"}
	var precio = 1350
	 //get and set
	method precio()= precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esDestacado(){
		return precio > 2000
	}	
	method precioConDescuento(unDescuento){
		precio -= self.descuentoDel(unDescuento)	
	}
	method descuentoDel(unDescuento){
		return (precio*unDescuento)/100
	}
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}
	method esPeligroso(){
		return requiereVacuna
	}
	
	method nombre()=nombre
	method equipaje() = equipaje	
}
object lastToninas{
	var requiereVacuna = true //Asumimos que el destino es el que sabe si requiere o no vacuna.
	var nombre = "Last Toninas"
	var equipaje = #{"Vacuna Gripal", "Vacuna B", "Necronomicon"}
	var precio = 3500
	method precio()= precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esDestacado(){
		return precio > 2000
	}	
	method precioConDescuento(unDescuento){
		precio -= self.descuentoDel(unDescuento)	
	}
	method descuentoDel(unDescuento){
		return (precio*unDescuento)/100
	}
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}
	method esPeligroso(){
		return requiereVacuna
	}
	
	method nombre()=nombre
	method equipaje() = equipaje
}
object goodAiris{
	var requiereVacuna = false //Asumimos que el destino es el que sabe si requiere o no vacuna.
	var nombre = "Good Airis"
	var equipaje =#{"Cerveza", "Protector Solar"}
	var precio = 1500
	method precio() = precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esDestacado(){
		return precio > 2000
	}		
	method precioConDescuento(unDescuento){
		precio -= self.descuentoDel(unDescuento)	
	}
	method descuentoDel(unDescuento){
		return (precio*unDescuento)/100
	}
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}
	method esPeligroso(){
		return requiereVacuna
	}
		
	method nombre()=nombre
	method equipaje() = equipaje	
}