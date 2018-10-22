class Video inherits Publicacion{
	const property duracion
	
	method espacio() = duracion
}

class VideoHD inherits Video{
	
	method espacio() = 3 * super()
}
