class Vaca {
	var property peso
	var property tieneSed
	var property convieneVacunar = true
	
	method tieneHambre() = peso < 200

	method comer(cantidad) {
		peso += cantidad / 3
		tieneSed = true
	}
	method beber() {
		tieneSed = false
		peso -= 0.5
	}
	method vacunar() {
		convieneVacunar = false
	}
}

class Cerdo {
	var property peso
	var cantidadComidasSinBeber = 0
	var property tieneHambre
	var property tieneSed
	var property maximoComido = 0
	const property convieneVacunar = true
	
	method comer(cantidad) {
		self.aumentarPeso(cantidad - 0.2)
		self.comerSinBeber()
		maximoComido = maximoComido.max(cantidad)
	}
	method beber() {
		tieneSed = false
		tieneHambre = true
		cantidadComidasSinBeber = 0
	}
	method vacunar() {}	
	method aumentarPeso(cantidad) {
		peso += cantidad.max(0) /* Nunca puede restar */
	}
	method comerSinBeber() {
		cantidadComidasSinBeber += 1
		if(cantidadComidasSinBeber > 3) 
			tieneSed = true
	}
}

class Gallina {
	var property cantidadComidas = 0
	
	method tieneHambre() = true
	method tieneSed() = false
	method convieneVacunar() = false
	method comer(cantidad) {
		cantidadComidas += 1
	}
	method beber() {}
	method vacunar() {}
}