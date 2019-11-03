import MedioDeTransporte.*
import Localidad.*
import BarrileteCosmico.*
import MedioDeTransporte.MedioDeTransporte

class Usuario {
	var nombre
	var viajes = [] // "reemplazaria" a los destinos - lugares en el TP1-
	var usuariosQueSigue
	var billeteraVirtualEnBarrileteCosmico
	var localidadOrigen
 	var property asistenciaSeguro
	
	constructor (unNombre,unosViajes,unosUsersQueSigue,unaBilleteraVirtual,unaLocalidadDeOrigen,unaAsistencia){
		nombre = unNombre
		viajes= unosViajes
		usuariosQueSigue= unosUsersQueSigue
		billeteraVirtualEnBarrileteCosmico = unaBilleteraVirtual
		localidadOrigen=unaLocalidadDeOrigen
		asistenciaSeguro = unaAsistencia
	}
	
	method agregarViaje(unViaje){
		viajes.add(unViaje)
	}

	method volarA(unDestino){
		
		if(self.alcanzaDinero(unDestino)){
	//ya que el nuevo origen sera los nuevos destinos que tenga, entonces lo modifico
			var viaje = BarrileteCosmico.armarViaje(localidadOrigen,unDestino)
			localidadOrigen = unDestino.localidadFinal()
			self.descontarDinero(unDestino)
			self.agregarViaje(viaje)	
		}
		else{
		throw new ErrorMoneyRejectedException(message = "me duelen los bolsillos");
		}
	}
	 
	
	method alcanzaDinero(unDestino){
		return (unDestino.precio() <= billeteraVirtualEnBarrileteCosmico)
	}
	method descontarDinero(unDestino){
		billeteraVirtualEnBarrileteCosmico -= unDestino.precio()
	}
	/*
	 * es dificil la interpretacion, a mi entender dicen que los kilometros de cada usuario sera entre 
	 * los origenes de donde arranca (localidadOrigen) + los destinos de los viajes que tiene
	 * y como pueden tener muchos viajes hechos, entonces es mejor que haga una funcion que sume todos los viajes
	 * de la lista 
	 */
	method kilometrosRecorridos(){
		viajes = viajes.sum({unViaje => unViaje.ubacionEnKm()})
	}
	method perseguirAAlguien(unUsuario){
		usuariosQueSigue.add(unUsuario)
	}
	method devolverFollow(){
		self.perseguirAAlguien(self)
	}
	method dondeEsta(){
		return localidadOrigen
	}
	
	method plataQueTiene() = billeteraVirtualEnBarrileteCosmico
	
	//Como aun verdaderamente no sabemos bien que hace cada perfil, sino que lo sabemos a grandes
	//rasgos sin tener información en concreto, determinamos que por ahora solo podemos encargarnos
	//de consultar a que tipo de perfil pertenece, pero sin compararlo contra nada, aunque
	//existe la posibilidad de hacerlo con un futuro switch case o varios ifs (aunque a nadie le va a gustar ver eso) 
	
	
}

class Empresario inherits Usuario {
	method elegirVehiculo(){
		MedioDeTransporte.transporteMasRapido()  //No lo probe, pero creo que funciona
	}
}

class Estudiante inherits Usuario {
	method elegirVehiculo(){
		MedioDeTransporte.transporteMasRapido().transporteMasBarato()
	}
}

class Familiero inherits Usuario {
	method elegirVehiculo(unMedioTransporte){
		unMedioTransporte.transportes().anyOne()
		//ya que puede elegir a cualquiera de una lista de transporte
	} 
}


class ErrorMoneyRejectedException inherits Exception{}