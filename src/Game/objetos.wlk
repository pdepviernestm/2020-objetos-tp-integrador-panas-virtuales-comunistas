import wollok.game.*
import juanTamagochi.*
import mapas.*
import personajesVisuales.*
import productos.*
import stats.*
import exepciones.*

class ObjetoVisualBasico{    //modificar si se repite algo mas q necesita productos y ya tenia bjeto visual
	var property position = game.origin()
	const property imagen

	method image()=imagen
	method configurarVisual(x,y){
		position=game.at(x, y)
		game.addVisual(self)
	}
	method borrarSuVisual(){
		game.removeVisual(self)	
	}
}
    const bloqueVacio = new ObjetoVisualBasico(imagen="Punto.png")
    
class ObjetoVisual inherits ObjetoVisualBasico{
	const property x
	const property y
	const property esDeTransicion = false
	const property accionPrimaria ={parametro=>} //bloques que no hacen nada,hay que modificar en cada new ObjetoVisual(como por ej cama), es lo que define la accion de cada uno
	const property accionSecundaria={parametro=>}
	const property mapaNuevo = null
	const property posicionEnMapaNuevo = null
	
    method configurarVisual(){
		position=game.at(x,y)
		game.addVisual(self)
	}

	method puedeActivarAccion(posicionDelPersonaje){
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
	
    const mostrarTeclas = new ObjetoVisual(x=6,y=0,imagen="teclas.png")

object carrito {
	var property productos = []
	const property position= game.at(7,7)
	const property protagonista = personajePrincipal
	method image()="feliz.jpg"
	method agregarVisual(){
		game.addVisual(self)
	}
	
	method agregarProducto(producto){
		productos.add(producto)
		const nombreProducto = producto.nombre()
		notificador.decir(protagonista,"agregué une " + nombreProducto +" al carrito")
	}
	method sacarProducto(producto){
		productos.remove(producto)
	}
	method vaciarCarrito(){
		productos = []
		game.say(protagonista,"El carrito esta vacio")
	}
	method calcularPrecio(){
		return self.listaDePrecios().sum()	
	}
	method listaDePrecios(){
		return productos.map({unProducto => unProducto.precioDelProducto()})
	}
	method cantidadDe(nombreProducto){
		return (self.listaDe(nombreProducto).size())
	}
	method listaDe(nombreDeProducto){
		return productos.filter{unProducto=>unProducto.tieneMismoNombre(nombreDeProducto)}
	}
	method informarMontoYCantidad(loDice){
		const precio = self.calcularPrecio()
			game.say(loDice,"el precio es "+ precio.toString())
	}
	method cobrar(){
		const precio = self.calcularPrecio()
		if(precio <= statsDelJuego.cantidadPlata()) {
			self.carritoVacio()
			protagonista.gastarPlata(-precio)
			self.guardarProductosEnMochila()                    
            productos = []
            game.clear()
            juanTamagochi.configurar()
            protagonista.volverACasa()
            protagonista.plataActual()
		}
	}
	method carritoVacio(){
		if(productos.size() < 1){
			game.say(protagonista,"no tengo nada en el carrito :/")
			throw new NoSePudoAtenderException(message="No se puede atender a Juan porque tiene el carrito vacio")
			}
	}
	method guardarProductosEnMochila(){
		productos.forEach({producto => mochila.agregarProducto(producto)})
	}
	method seleccionarBarato(){
		self.filtrarProductoPorPrecio(200).forEach({producto => self.sacarProducto(producto)})
		game.say(protagonista,"Me quedo con lo barato")
	}
	method filtrarProductoPorPrecio(precio){
		return productos.filter{producto=>producto.precio()>precio}
	}
	method encontrarProducto(){
		return productos.find({producto => producto.precio() > 50 })
	}
	
}

object mochila {
	var property productos = []
	var property x = 2
	var property y = 2
	const imagen = "interiorMochila.png"
	const property position = game.origin()
	method agregarProducto(producto){
		productos.add(producto)
	}
	method sacarProducto(producto){
		productos.remove(producto)
	}
	method encontrarProducto(){
		return productos.find({producto => producto.precio() > 50 })
	}
	method comer(producto){
		
		producto.producirEfecto()
	}
	method image() = imagen
	
	method configurarTeclas(){
		const lista =[0,1,2,3,4,5,6,7,8,9]
		lista.forEach{numero => keyboard.num(numero).onPressDo{self.UsarObjetoEnMochila(productos.get(numero))}}
	}
	
	method UsarObjetoEnMochila(producto){
		producto.producirEfecto()
		self.sacarProducto(producto)
		game.removeVisual(producto)
		self.cerrar()
		self.abrir()
	}

	method abrir(){              
		game.addVisual(self)
		productos.take(10).forEach{producto => producto.configurarVisual(x,y) self.calcularPocicion()}
		self.configurarTeclas()
	}
	method calcularPocicion(){
		x+=1
		if (x>3 || y<3){
			x = 1
			y+=1
		}
	}
	
	method cerrar(){
		x = 2
		y = 2
		game.clear()
		juanTamagochi.configurar()
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

object removedor{
	var property juego = game
	
	method sacarVisual(lugar){
		juego.sacar(lugar)
	}	
}

object lugarDeMentira{
	
	method sacar(lugar){}
	
	
}

object removedorDeEvento{

	var property juego = game
	
	method sacarTick( palabraMentirosa){
		juego.sacarT( palabraMentirosa)
	}
		
}

object eventoDeMentira{
	
	method sacarT(palabraMentirosa){}
	
}