class ComederoNormal {
	var property pesoMaximo
	var property tamanioRacion
	var property cantidadRaciones = 30
	
	method puedeAtenderA(animal) =
		animal.tieneHambre() and
		self.soportaPeso(animal)
	method soportaPeso(animal) =
		animal.peso() < pesoMaximo
	method atenderA(animal) {
		animal.comer(tamanioRacion)
		cantidadRaciones -= 1
	}
}

class ComederoInteligente {
	var property cantidadComida
	
	method puedeAtenderA(animal) =
		animal.tieneHambre()
	method atenderA(animal) {
		var racion = animal.peso() / 100
		animal.comer(racion)
		cantidadComida -= racion
	}
}

class Bebedero {
	var property cantidadDeRecarga = 0
	var property animalesAtendidos = []
	
	method fueAtendido(animal) = animalesAtendidos.contains(animal)
	
	method puedeAtenderA(animal) =
		animal.tieneSed()
	method atenderA(animal) {
		animal.beber()
		animalesAtendidos.add(animal)
		cantidadDeRecarga += 1
	}
	method cantidadDeAnimalesAtendidos() = animalesAtendidos.size() // asi me dice todas las veces que se atendieron, si quiero saber por animal sin repetir animalesAtendidos.asSet().size()
	method animalesQueConvieneVacunar() = animalesAtendidos.filter({animal => animal.convieneVacunar()}).asSet()
	method animalMasPesado() = animalesAtendidos.max({animal => animal.peso()})
	method pesoTotal() = animalesAtendidos.sum({animal => animal.peso()})
	//Siempre que necesito recorrer una lista que estoy modificando, hay que hacerme una copia de esa lista sobre la cual trabajar para tener el resultado deseado.
	method atenderATodos(){
		animalesAtendidos.asSet().forEach({animal => self.atenderA(animal)})
	}
}

class Vacunatorio {
	var cantidadVacunas = 50
	
	method puedeAtenderA(animal) =
		animal.convieneVacunar()
	method atenderA(animal) {
		animal.vacunar()
		cantidadVacunas -= 1
	}
}