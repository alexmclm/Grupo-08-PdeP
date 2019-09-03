import lugares.*
import usuario.*
object barrileteCosmico {
	var destinos = #{}
	method agregarDestinos(unosDestinos){
		destinos.add(unosDestinos)
	} 
	method destinosImportantes(){
		return destinos.filter({unDestino => unDestino.esDestacado()})
	}
	method darDescuento(unDescuento){
		destinos.forEach({unDestino => unDestino.precioConDescuento(unDescuento)})
	}
	method agregarAlEquipaje(unElemento){
		destinos.forEach({unDestino => unDestino.agregarAlEquipaje(unElemento)})
	}	
	/*
	method esExterna(){
		return destinos.any({unDestino => unDestino.contains()})
	}
	*/
	method cartasDeDestinos(){
		return destinos
	}
	
}
