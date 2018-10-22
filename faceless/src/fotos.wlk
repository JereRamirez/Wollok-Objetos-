class Foto inherits Publicacion{
	const alto
	const ancho
	
	method espacio()= alto * ancho * foto.factorCompresion()
}

object foto{
	var property factorCompresion
}
