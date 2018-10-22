import animales.*
import dispositivos.*

class EstacionDeServicio {
	const property dispositivos = []
	
	method puedeAtenderA(animal) =
		dispositivos.any({dispositivo => dispositivo.puedeAtenderA(animal)})
	method atenderA(animal) {
		self.dispositivoQuePuedeAtenderA(animal).atenderA(animal)
	}
	method dispositivoQuePuedeAtenderA(animal) =
		dispositivos.find({dispositivo => dispositivo.puedeAtenderA(animal)})
}