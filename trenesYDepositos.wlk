class Formacion {
	const vagones 
	const locomotoras
	
	method totalDePasajeros() =	vagones.sum({vagon => vagon.totalDePasajeros()})
	method cantidadVagonesLivianos() = vagones.count({vagon => vagon.esLiviano()})
	method velocidadMaxima() = locomotora.min({ locomotora => locomotora.velocidadMaxima()}) 
	method esEficiente() = locomotora.all({ locomotora => locomotora.esEficiente()})
	method puedeMoverse() = self.arrastreUtil() > self.pesoMaximoVagones()
	method arrastreUtil() = locomotora.sum({ locomotora => locomotora. arrastreUtil()})
	method pesoMaximoVagones() = vagones.sum({ vagon => vagon.pesoMaximo() })
	method empujeFaltante() = 0.max(self.pesoMaximoVagones() - self.arrastreUtil())
	method vagonMasPesado() = vagones.max({vagon => vagon.pesoMaximo()})
	method esCompleja() = self.esLarga() || self.esPesada()
	method esLarga() = self.cantidadUnidades() > 20
	method cantidadUnidades() = vagones.size() + locomotoras.size()
	method esPesada() = self.pesoTotal() > 10000
	method pesoTotal() = self.pesoMaximoVagones() + self.pesoMaximoLocomotoras()
	method pesoMaximoLocomotoras() = locomotoras.sum({ locomotora => locomotora.peso()})
	method agregarLocomotora(loco){
		locomotoras.add(loco)
	}
}

class Deposito {
	const formaciones
	const locomotoras
	
	method vagonesMasPesados() = formaciones.map({ formacion => formacion.vagonMasPesado()})	
	method necesitaConductorExperimentado() = formaciones.any({ formacion => formacion.esCompleja() })
	method agregarLocomotora(formacion) {
		if(not formacion.puedeMoverse()){
			const locomotora = locomotoras.findOrElse({locomotora => locomotora.puedeEmpujar(formacion.empujeFaltante())},{throw new NoHayLocomotoraException("No se encontró Locomotora que pueda mover la formacion")})
			formacion.agregarLocomotora(locomotora)
			self.eliminarLocomotora(locomotora)
		}
	}
	method eliminarLocomotora(_locomotora) {
		 locomotoras.remove(_locomotora) 
	}
}

class Vagon{
	
	method esLiviano() = self.pesoMaximo() < 2500
	method pesoMaximo()
}

class VagonDeCarga inherits Vagon{
	const cargaMaxima
	
	method totalDePasajero() = 0
	override method pesoMaximo() = cargaMaxima + 160 	
}

class VagonDePasajeros inherits Vagon{
	const largo
	const anchoUtil
	
	method totalDePasajeros() = largo * self.multiplicadorPasajeros()
	method multiplicadorPasajeros() = if (anchoUtil <= 2.3) 8 else 10 
	override method pesoMaximo() = self.totalDePasajeros() * 80
}

class Locomotora{
	const property velocidadMaxima
	const property peso
	const pesoMaximo
	
	method esEficiente() = self.puedeArrastrar(5 * peso)
	method puedeArrastrar(_peso) = pesoMAximo > _peso
	method arrastreUtil() = pesoMaximo - peso  
	method puedeEmpujar(kilos) = self.puedeArrastrar(kilos + peso)
}