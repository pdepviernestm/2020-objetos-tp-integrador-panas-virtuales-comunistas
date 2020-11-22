import wollok.game.*
import acciones.*
import stats.*
import trabajos.*
import juanTamagochi.*
import mapas.*
import objetos.*
import productos.*
import exepciones.*

object personajePrincipal {
	var property position = game.origin()
	var property trabajoActual = trabajos.listaTrabajos().head()
	var puedeCambiarDeTrabajo=true
	
	method comprarCaramelo(){
		if(!self.puedeComprarCaramelo()){
			self.error("No puede comprar caramelo raro")
		}
		carrito.agregarProducto(new Producto(nombre = "CarameloRaro", precio = 800, valorEnergia = 100, valorHumor = 100, valorSaciedad = 100, valorHigiene = 100, valorSalud = 100,imagen="CarameloRaro.png"))
	}
	
	method puedeComprarCaramelo() = statsDelJuego.humorDePersonaje().cantidad() > 80
	
	
	method agregarProducto(producto){
		carrito.agregarProducto(producto)
		
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
	method informarMontoYCantidad(loDice){
		carrito.informarMontoYCantidad(loDice)
	}
	method cobrar(){
		carrito.cobrar()
	}
	method seleccionarBarato(){
		carrito.seleccionarBarato()
	}
	method encontrarProducto(){
		return carrito.encontrarProducto()
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
	method delivery(){
		personaje.delivery()
		game.say(self,"Me pido una pizza :D")
		}
	method contarDias(){
		game.say(self,"Ya pase "+ statsDelJuego.dias() +" dias en cuarentena")
	}
	method salir(){
		personaje.salir()
		game.say(self,"Voy de shopping :D")
	}
	
	method movermeA(lugar, x, y){
		if(!coronavirusDePersonaje.contagiado()){
			juanTamagochi.modificarMapa(lugar, game.at(x,y))
			personaje.salio(true)
		}
	}

	method movermeAlBanio(){
		juanTamagochi.modificarMapa(banio,game.at(0,1))
	}
	method volverACasa(){
		carrito.vaciarCarrito()
		personaje.salio(false)
		juanTamagochi.modificarMapa(living,game.at(1,5))
	}
	method salirDelBanio(){
		juanTamagochi.modificarMapa(living,game.at(6,11))
	}
	method movermeABoleta(){
		self.carritoVacio()
	    juanTamagochi.modificarMapa(boleta,game.at(8,2))
	    boleta.agregarObjetosCarrito()
	}
	method carritoVacio(){
		if(carrito.productos().size() < 1){
			game.say(self,"no tengo nada en el carrito :/")
			throw new NoSePudoAtenderException(message="No se puede atender a Juan porque tiene el carrito vacio")

			}
	}
	method comer(){
		personaje.comer()
		game.say(self,"Comiendo :D")
	}
	method meContagie(){
		game.say(self,"Me falta el aire")
		coronavirusDePersonaje.meContagie()
	}
	method meCure(){
		game.say(self,"me siento Mejor")
		coronavirusDePersonaje.meCure()
	}
	method tengoCorona() {             //Me da Corona q resta salud sobre tiempo
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
	method cambiarStats(valorEnergia,valorHumor,valorSaciedad,valorHigiene,valorSalud){
		personaje.cambiarStats(valorEnergia,valorHumor,valorSaciedad,valorHigiene,valorSalud)
	}
	
}
