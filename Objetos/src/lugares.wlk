object garlicSea {
	
	var equipaje = #{"Caña de pescar", "Piloto"}
	var precio = 2500 // considero que si bien puede aplicarle todos los descuento que se le cante, debe tener una base y en base a la economia cambiara con set
	method precio() = precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esImportante(){
		return precio > 2000
	}
	method precioConDescuento(unDescuento){
		precio -= (precio * unDescuento)/100
	}
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}
}
object silversSea{
	var equipaje = #{"Protector Solar", "Equipo de Buceo"}
	var precio = 1350
	 //get and set
	method precio()= precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esImportante(){
		return precio > 2000
	}	
	method precioConDescuento(unDescuento){
		precio -= (precio * unDescuento)/100
	}	
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}
}
object lastToninas{
	var equipaje = #{"Vacuna Gripal", "Vacuna B", "Necronomicon"}
	var precio = 3500
	method precio()= precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esImportante(){
		return precio > 2000
	}	
	method precioConDescuento(unDescuento){
		precio -= (precio * unDescuento)/100
	}
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}
}
object goodAiris{
	var equipaje =#{"Cerveza", "Protector Solar"}
	var precio = 1500
	method precio() = precio
	method precio(unPrecio){
		precio = unPrecio
	}
	method esImportante(){
		return precio > 2000
	}		
	method precioConDescuento(unDescuento){
		precio -= (precio * unDescuento)/100
	}
	method agregarAlEquipaje(unElemento){
		equipaje.add(unElemento)
	}	
}