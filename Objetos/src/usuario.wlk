import lugares.*
import barrileteCosmico.*
object pabloHari {
	var lugares =#{lastToninas,goodAiris} // los conoce de prepo
	var usuariosQueSigue=[]
	var billeteraVirtualEnBarrileteCosmico = 1500
	method agregarDestino(unDestino){
		lugares.add(unDestino)
	}
	
	method volarA(unDestino){
		if(self.alcanzaDinero(unDestino)){
			self.descontarDinero(unDestino)
			self.agregarDestino(unDestino)
		}
	}
	 
	
	method alcanzaDinero(unDestino){
		return (unDestino.precio() <= billeteraVirtualEnBarrileteCosmico)
	}
	method descontarDinero(unDestino){
		billeteraVirtualEnBarrileteCosmico -= unDestino.precio()
	}
	method kilometrosRecorridos(){
		return (self.conjuntoPrecio()*10)/100
	}
	method conjuntoPrecio(){
		return lugares.sum({unLugar => unLugar.precio()})
	}
	method perseguirAAlguien(unUsuario){
		usuariosQueSigue.add(unUsuario)
	}
	method devolverFollow(){
		self.perseguirAAlguien(self)
	}
	method plataQueTiene() = billeteraVirtualEnBarrileteCosmico
}
