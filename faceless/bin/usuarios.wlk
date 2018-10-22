class Usuario{
	const property publicaciones 
	const property amigos = #{}
	
	
	method espacioQueOcupa() = publicaciones.sum({publicacion => publicacion.espacio()})
	
	method esMasAmistosoQue(unUsuario) = self.cantidadAmigos > unUsuario.cantidadAmigos()
	
	method cantidadAmigos() = amigos.size()
	
	method mejoresAmigos() = amigos.filter({amigo => amigo.puedeVer(publicaciones)})
	
	method puedeVer(publicaciones) = publicaciones.all({ p => p.puedeSerVistaPor(self)})
	
	method amigoDe(usuario) = amigos.contains(usuario)
	
	method amigoMasPopular() = amigos.max({a => a.meGustas()})
	
	method meGustas() = publicaciones.sum({p => p.cantidadMeGusta()})
	
	method publicar(publicacion, permiso) {
		publicacion.permiso(permiso)
		publicaciones.add(publicacion)
	}
}