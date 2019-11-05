class Vendedor{
	var property productos
	var property puntaje
	var property provincias = []
	var property certificaciones = #{}
	
	method agregarCertificacion(unaCertificacion){
		certificaciones.add(unaCertificacion)
	}
	method esProducto(){
		certificaciones.any()
	}
	method puedeTrabajar(ciudad)

 
			
	method esVersatil(){
		return
		 certificaciones.size() >= 3 and
		 certificaciones.any({self.esProducto()}) and
		 not certificaciones.any({self.esProducto()})
		
	}
	method puntajeTotal(){
		return certificaciones.sum()
	}
	
	method esFirme(){ 
		return self.puntajeTotal() >= 30
		
		
	}
	method esInfluyente()
	
	method certifiacionesProductos(){
		return productos
	}
	
	


}

class VendedorFijo inherits Vendedor{


	const property ciudadVive
	
	override method puedeTrabajar(ciudad){
		return ciudadVive == ciudad
	} 
	override method esInfluyente(){
		return false
	}
	 
	
}


class Viajante inherits Vendedor{
	

	method estaHabilitado(prov){
		provincias.add(prov)
		
	}
	override method puedeTrabajar(ciudad){
		return  provincias.any({ciudad.provincia()})
		
	//	return 
	}
	override method esInfluyente(){
		return self.poblacionTotal()>=10000000
	}
	method poblacionTotal(){
		return provincias.sum({prov => prov.poblacion()})
	}
	
}
class ComercioCorresponsal inherits Vendedor{
	var property sucursales = []	
	override method puedeTrabajar(ciudad){
		return sucursales.any({ciudad})
	}
	override method esInfluyente(){
		return sucursales.size()>=5 or self.todasLasProvincias().size() >= 3
	}
	method todasLasProvincias(){
		return provincias.map({prov => prov.provincia()}).asSet()
	}

	
	
}
class Ciudad{
	var property provincia

}
class Provincias{
	var property poblacion
}