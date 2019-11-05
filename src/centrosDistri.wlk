import Vendedores.*
class Centros {
	var property lugar
	var property vendedores = []
	
	method agregarseVendedor(vendedor){
		if(vendedores.contains(vendedor)){
			self.error("ya esta registrado")
		
		}
			vendedores.add(vendedor)
		
		
	}
	method vendedorEstrella(){
		return vendedores.max({vend => vend.puntajeTotal()})
	}
	method puedeCubrir(ciudad){
		return vendedores.any({ciu => ciu.puedeTrabajar(ciudad)})
		
	}
	method coleccionVendedores(){
		return vendedores.filter({vend => vend.certifiacionesProductos()})
	}
	//revisar
	method esRobusto(){
		return vendedores.any({vend => vend.esFirme()<=3})
	}
	
	
}
