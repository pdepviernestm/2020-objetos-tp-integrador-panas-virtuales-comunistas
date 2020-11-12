import wollok.game.*
import acciones.*
import stats.*
import trabajos.*
import juanTamagochi.*
import mapas.*
import objetos.*


object personajePrincipal {
	var property position = game.origin()
	var property trabajoActual = trabajos.listaTrabajos().head()
	var puedeCambiarDeTrabajo=true
	
	
	method agregarComida(comida){
		carrito.agregarComida(comida)
		
	}
	method vaciarCarrito(){
		carrito.vaciarCarrito()
	}
	method calcularPrecio(){
		return carrito.calcularPrecio()
	}
	method cantidadDe(nombreProducto){
		return carrito.cantidadDe(nombreProducto)
	}
	method informarMontoYCantidad(){
		carrito.informarMontoYCantidad()
	}
	method cobrar(){
		carrito.cobrar()
	}
	method seleccionarBarato(){
		carrito.seleccionarBarato()
	}
	method encontrarComida(){
		return carrito.encontrarComida()
	}
	method image() = "avatar.png" 
	method saludo() = "Hola! :D" // Mensaje de prueba
	method dormir(){
		personaje.dormir()
		game.say(self,"Zzz...")
	}
	method lavarseLasManos(){
		personaje.lavarseLasManos()
		game.say(self,"Me lavo las manos :D")
	}
	method defecar(){
		personaje.defecar()
		game.say(self,"Usando el trono :D")
	}
	method trabajar(){
		trabajoActual.trabajar()
		game.say(self,"Trabajo en la oficina :D")
	}
	method trabajarEnCasa(){
		if (trabajoActual.trabajaEnCasa()){
		trabajoActual.trabajar()
		game.say(self,"Trabajo en Casa :D")
		}
	}

	method cambiarDeTrabajo(){
		if(puedeCambiarDeTrabajo){
			game.removeVisual(trabajoActual)
			trabajos.listaTrabajos().add(trabajoActual)
			trabajos.listaTrabajos().remove(trabajoActual)
			trabajoActual=trabajos.listaTrabajos().head()
			game.say(self,"Mi trabajo ahora es: "+trabajoActual.nombre())
			self.configurarVisualTrabajo()
			puedeCambiarDeTrabajo=false
			game.onTick(30000,"cambio trabajo",{puedeCambiarDeTrabajo=true})
			}
	} 
	method configurarVisualTrabajo(){
		game.addVisual(trabajoActual)
	}
	method comprarComida(){
		personaje.comprarComida()
		game.say(self,"Me pido una pizza :D")
		}
	method contarDias(){
		game.say(self,"Ya pase "+ statsDelJuego.dias() +" dias en cuarentena")
	}
	method salir(){
		personaje.salir()
		game.say(self,"Voy de shopping :D")
	}
	
	method movermeAlSuper(){
	juanTamagochi.modificarMapa(superMercado,game.at(1,1))
	}
	method movermeAOficina(){
		juanTamagochi.modificarMapa(oficina,game.at(8,0))
	}

	method movermeAlBanio(){
		juanTamagochi.modificarMapa(banio,game.at(0,1))
	}
	method volverACasa(){
		juanTamagochi.modificarMapa(living,game.at(1,5))
	}
	method salirDelBanio(){
		juanTamagochi.modificarMapa(living,game.at(6,11))
	}
	method movermeABoleta(){
	    juanTamagochi.modificarMapa(boleta,game.at(8,2))
	}
	method movermeAMochila(){
	    juanTamagochi.modificarMapa(mochila,game.at(1,1))
	}
	method volverAtras(ultimoLugar,ubicacion){
		juanTamagochi.modificarMapa(ultimoLugar,ubicacion)
	}	

	method comer(){
		personaje.comer()
		game.say(self,"Comiendo :D")
	}
	method tengoCorona() {             //Me da Corona q resta salud sobre tiempo
		if(personaje.higieneBaja())
		  game.onTick(30000, "modifica salud cada 30 segundos", {personaje.efectoCorona()})
	}
	method morir(){
		return personaje.morir()
	}
	method cambiarPosicion(posicionNueva){
		position = posicionNueva
	}
	method cantidadDe(lista,producto){
		const cantidad = (lista.filter({objeto => objeto.nombre() == producto}).size())
		game.say(self,"Tengo " + cantidad.toString() + " " + producto.toString() +"s")
	}
	method plataActual(){
		game.say(self,"Me quedan " + statsDelJuego.cantidadPlata().toString() + " mangos")
	}
	method estadoActual(){
		game.say(self,"Mi salud " + statsDelJuego.saludDePersonaje().cantidad().toString())
		game.say(self,"Mi humor " + statsDelJuego.humorDePersonaje().cantidad().toString())
		game.say(self,"Mi higiene " + statsDelJuego.higieneDePersonaje().cantidad().toString())
		game.say(self,"Mi hambre " + statsDelJuego.saciedadDePersonaje().cantidad().toString())
	}
	
}
