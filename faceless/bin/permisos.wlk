object publico {
	
	method puedeVer(usuario) = true
}

object soloAmigos {

	method puedeVer(usuario,autor) = autor.amigoDe(usuario) 	
}

class ListaBlanco {
	const property listaBlanca = #{}
	
	method puedeVer(usuario,autor) = listaBlanca.contains(usuario)
}

class ListaNegra {
	const property listaNegra = #{}
	
	method puedeVer(usuario,autor) = not listaNegra.contains(usuario)
}