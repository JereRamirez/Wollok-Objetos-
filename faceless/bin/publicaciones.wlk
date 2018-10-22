class Publicacion{
	var property usuariosQueDieronMeGusta = #{}
	var property permiso
	const property autor
	
	method espacio()
	method darMeGusta(usuario){
		if(not usuariosQueDieronMeGusta.contains(usuario))
			usuariosQueDieronMeGusta.add(usuario)
		else
			throw new userException("El usuario ya dio el me gusta a la publicación")
	}
	
	method puedeSerVistaPor(usuario) = permiso.puedeVer(usuario, autor)
	
	method mostrarA(usuario) = {
		if(self.puedeSerVistaPor(usuario))
			self.mostrar()
		else
			throw new noTienePermisosException()
	}
}
