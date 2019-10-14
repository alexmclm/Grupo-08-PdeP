import Localidad.*
import Usuario.*
import Viaje.*

class BarrileteCosmico {
	
	var localidades = #{}
	var transporte = #{}
	var usuario
	
	constructor (unasLocalidades, unosTransportes,unUsuario){
		localidades = unasLocalidades
		transporte = unosTransportes
		usuario = unUsuario
	}
	method agregarDestinos(unasLocalidades){
		localidades.add(unasLocalidades)
	} 
	method destinosImportantes(){
		return localidades.filter({unaLocalidad => unaLocalidad.esDestacado()})
	}
	method darDescuento(unDescuento){
		localidades.forEach({unDestino => unDestino.precioConDescuento(unDescuento)})
	}
	
	method esExtrema(){
		return localidades.any({unaLocalidad => unaLocalidad.esPeligroso()})
	}
	
	method cartasDeDestinos(){
		return localidades.map({unaLocalidad=>unaLocalidad.nombre()})
	}
	
	method verDestinos(){
		return localidades
	}
	
	method lugaresPeligrosos(){
		 return localidades.filter({unaLocalidad => unaLocalidad.esPeligroso()})
	}
	// parte 2 del tp
	method armarElViaje(unaLocalidad,unDestinoFinal){
	 	//por que dice que debo armar el viaje para UN USUARIO
	 	//los viajes ahora son por separado donde se necesita el origen, que sera donde el USUARIO ESTARA PARADO
	 	//el destino final, que lo paso por parametro 
	 	//y el transporte que sera cualquiera
	 	
	return new Viaje (unaLocalidad,unDestinoFinal,transporte.anyOne())
	}
     
}
