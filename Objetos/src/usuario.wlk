import lugares.*
import barrileteCosmico.*
object pabloHari {
	var lugares =#{lastToninas,goodAiris} // los conoce de prepo
	var usuariosQueSigue=[]
	var billeteraVirtualEnBarrileteCosmico = 1500
	var kilometrosRecorridos =0
	method agregarDestino(unDestino){
		lugares.add(unDestino)
	}
	
	method volarA(unDestino){
		if(self.alcanzaDinero(unDestino)){
			self.descontarDinero(unDestino)
			self.agregarDestino(unDestino)
		}else{
			"soy un tarado, aplaste un pescado "
		}
	}
	 
	
	method alcanzaDinero(unDestino){
		return (unDestino.precio() <= billeteraVirtualEnBarrileteCosmico)
	}
	method descontarDinero(unDestino){
		billeteraVirtualEnBarrileteCosmico -= unDestino.precio()
	}
	method kilometrosRecorridos(){
		kilometrosRecorridos = (self.conjuntoPrecio()*10)/100
	}
	method conjuntoPrecio(){
		return lugares.sum({unLugar => unLugar.precio()})
	}
	method perseguirAAlguien(unUsuario){
		usuariosQueSigue.add(unUsuario)
	}
	method kilometros() = kilometrosRecorridos
	
	method plataQueTiene() = billeteraVirtualEnBarrileteCosmico
}
