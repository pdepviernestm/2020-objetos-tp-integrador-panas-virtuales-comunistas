import wollok.game.*
import juanTamagochi.*
import mapas.*
import personajesVisuales.*
import productos.*
import stats.*

class ObjetoVisual{
	const property x
	const property y
	const property imagen
	const property esDeTransicion = false
	const property accionPrimaria ={parametro=>} //bloques que no hacen nada,hay que modificar en cada new ObjetoVisual(como por ej cama), es lo que define la accion de cada uno
	const property accionSecundaria={parametro=>}
	const property mapaNuevo = null
	const property posicionEnMapaNuevo = null
	var property position = game.origin()
	method image()=imagen
	method configurarVisual(){
		position=game.at(x,y)
		game.addVisual(self)
	}
	method borrarSuVisual(){
		game.removeVisual(self)	
	}
	method activarAccion(posicionDelPersonaje){
		return posicionDelPersonaje == self.position() && game.hasVisual(self)
	}
	method activarAccionPrimaria(personaje){
		accionPrimaria.apply(personaje)
	}
	method activarAccionSecundaria(personaje){
		accionSecundaria.apply(personaje)
	}
	method transicion(mapa){
		juanTamagochi.modificarMapa(mapa,posicionEnMapaNuevo)
	}
}
	const puertaEntradaBanio=new ObjetoVisual(x=7,y=11,imagen="puertaBaño.jpg",accionPrimaria={personaje => personaje.movermeAlBanio()})
	const pc=new ObjetoVisual(x=13,y=11,imagen="PC.jpg",accionPrimaria={personaje => personaje.trabajarEnCasa()} ,accionSecundaria={personaje => personaje.comprarComida()} )//
	const cama=new ObjetoVisual(x=7,y=7,imagen="cama.jpg",accionPrimaria={personaje => personaje.dormir()})
	const cocina=new ObjetoVisual(x=3,y=11,imagen="cocina.jpg",accionPrimaria={personaje => personaje.comer()})
	const salida=new ObjetoVisual(x=0,y=5,imagen="salidaLiving.jpg",accionPrimaria={personaje => personaje.movermeAlSuper()},accionSecundaria={personaje => personaje.movermeAOficina()})
	const heladera=new ObjetoVisual(x=5,y=11,imagen="heladera.png")
	const calendario = new ObjetoVisual(x=10,y=11,imagen="Punto.png",accionPrimaria={personaje => personaje.contarDias()})
	
	const lavamanos = new ObjetoVisual(x=3,y=2,imagen="lavaManos.jpg",accionPrimaria={personaje=>personaje.lavarseLasManos()})
	const inodoro = new ObjetoVisual(x=9,y=2,imagen="inodoro.jpg",accionSecundaria={personaje=>personaje.defecar()})
	const puerta = new ObjetoVisual(x=0,y=0,imagen="Punto.png",accionPrimaria={personaje=>personaje.salirDelBanio()})
	
	const pcOficina = new ObjetoVisual(x=1,y=8,imagen="punto.png",accionPrimaria={protagonista=>protagonista.trabajar()})
	const salidaOficina = new ObjetoVisual(x=8,y=0,imagen="punto.png",accionPrimaria={personaje=>personaje.volverACasa()})
	const mateAgeno =  new ObjetoVisual(x=3,y=8,imagen="mateAgeno.jpg",accionPrimaria={personaje=>personaje.meContagie()})

	const jojoPizza = new ObjetoVisual(x=7,y=11,imagen="jojoPizza.png",accionPrimaria={carro => carro.agregarComida(new Producto(nombre = "Pizza", precio = 300, valorEnergia = -5, valorHumor = 10, valorSaciedad = 100, valorHigiene = -5, valorSalud = -5))},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Pizza")})
	const jojaCola = new ObjetoVisual(x=2,y=7,imagen="jojaCola.png",accionPrimaria={carro => carro.agregarComida(new Producto(nombre = "JojaCola", precio = 100, valorEnergia = 10, valorHumor = 10, valorSaciedad = 10, valorHigiene = -5, valorSalud = -5))},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"JojaCola")})
	const fruta = new ObjetoVisual(x=2,y=11,imagen="fruta.png",accionPrimaria={carro => carro.agregarComida(new Producto(nombre = "Fruta", precio = 200, valorEnergia = 10, valorHumor = -5, valorSaciedad = 80, valorHigiene = -5, valorSalud = 10))},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Fruta")})
	const comidaBarata = new ObjetoVisual(x=7,y=7,imagen="comidaBarata.png",accionPrimaria={carro => carro.agregarComida(new Producto(nombre = "ComidaBarata", precio = 100, valorEnergia = -5, valorHumor = -5, valorSaciedad = 50, valorHigiene = -5, valorSalud = -10))},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Comida barata")})
	const basura = new ObjetoVisual(x=11,y=5,imagen="basura.png",accionPrimaria={carro => carro.vaciarCarrito()})	
	const cajera = new ObjetoVisual(x=1,y=3,imagen="Punto.png",accionPrimaria={carro=>carro.informarMontoYCantidad()})
	const caja = new ObjetoVisual(x=4,y=3,imagen="Punto.png",accionPrimaria={carro => carro.movermeABoleta()})
	const ahorrador = new ObjetoVisual(x=11,y=10,imagen="ahorradorT.png",accionPrimaria={carro => carro.seleccionarBarato()})
    const salidaSuper =new ObjetoVisual(x=1,y=0,imagen="alfombra.png",accionSecundaria={personaje => personaje.volverACasa()})
    const carameloRaro = new ObjetoVisual(x=7,y=3,imagen="CarameloRaro.png")
    const curaCorona = new ObjetoVisual(x=7,y=5,imagen="curaCorona.jpg")
    const alcoholGel = new ObjetoVisual(x=7,y=1,imagen="buenaSalud.jpg")
    
    const salidaBoleta = new ObjetoVisual(x=3,y=2,imagen="alfombra.png",accionSecundaria={personaje => personaje.movermeAlSuper()})
    const borrarCarrito = new ObjetoVisual(x=3,y=5,imagen="basura.png",accionPrimaria={carro => carro.vaciarCarrito()})
    const saldo = new ObjetoVisual(x=10,y=5,imagen="cajera.jpg",accionPrimaria={carro=>carro.informarMontoYCantidad()})
	const cobrar = new ObjetoVisual(x=10,y=2,imagen="PC.jpg",accionPrimaria={carro => carro.cobrar()})


object carrito {
	var property comidas = []
	const property position= game.at(7,7)
	const property protagonista = personajePrincipal
	method image()="feliz.jpg"
	method agregarVisual(){
		game.addVisual(self)
	}
	
	method agregarComida(comida){
		comidas.add(comida)
		const nombreComida = comida.nombre()
		notificador.decir(protagonista,"agregué une " + nombreComida +" al carrito")
	}
	method vaciarCarrito(){
		if(comidas == [])
			game.say(protagonista,"No tengo nada para tirar")
		else {
			comidas = []
			game.say(protagonista,"Vacie el carrito :/")
			}
	}
	method calcularPrecio(){
		return (comidas.map({unProducto => unProducto.precio()})).sum()	
	}
	method cantidadDe(nombreProducto){
		return (comidas.filter({unProducto=>unProducto.nombre() == nombreProducto})).size()
	}
	method informarMontoYCantidad(){
		const precio = self.calcularPrecio()
		const cantidadDePizzas=self.cantidadDe("Pizza")
		const cantidadDeJojaCola= self.cantidadDe("JojaCola")
		const cantidadDeComidaBarata=self.cantidadDe("Comidabarata")
		const cantidadDeFruta = self.cantidadDe("Fruta")
			game.say(superMercado.cajera(),"los productos son: "+cantidadDePizzas+" Pizzas, "+cantidadDeJojaCola+" JojaColas, "+cantidadDeComidaBarata+" comidas baratas, y "
											+cantidadDeFruta+" Frutas")
			game.say(superMercado.cajera(),"el precio es "+ precio.toString())
	}
	method cobrar(){
		const precio = self.calcularPrecio()
		if(precio <= statsDelJuego.cantidadPlata() && comidas.size() > 0 ) {
			statsDelJuego.modificarPlata(-precio)
			comidas.forEach({producto => mochila.agregarComida(producto)})                     
            comidas = []
            protagonista.volverACasa()
            protagonista.plataActual()
		}
	}
	method seleccionarBarato(){
		comidas.filter({comida => comida.precio() > 200}).forEach({comida => comidas.remove(comida)})
	}
	method encontrarComida(){
		return comidas.find({comida => comida.precio() > 50 })
	}
	
}

object mochila {
	var property comidas = [pizza]
	method agregarComida(comida){
		comidas.add(comida)
	}
	method sacarComida(comida){
		comidas.remove(comida)
	}
	method encontrarComida(){
		return comidas.find({comida => comida.precio() > 50 })
	}
	method comer(comida){
		
		comida.comer()
	}
}

object notificador{
	
	var property juego = game
	
	method decir(visual, mensaje){
		
		juego.say(visual, mensaje)
		
	}
	
	
}

object gameDeMentira{
	
	method say(visual, mensaje){
		
	}
	
}