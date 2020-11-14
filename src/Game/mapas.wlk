import wollok.game.*
import objetos.*
import juanTamagochi.*

class Mapa {
	const protagonista = juanTamagochi.protagonista()
	var property lista
	var property removido = false
	const property position = game.origin()
	const property imagen
	
	method image() = imagen
	
	method configurar(){
		self.configurarFondo()
		self.configurarTeclas()
	}
	method configurarFondo(){
		self.configurarVisual()
	}

	method cambioDeMapa(protag){
		self.borrarse()
		game.removeVisual(protag)
	}
	method configurarTeclas(){
		keyboard.s().onPressDo{lista.filter({objeto => objeto.puedeActivarAccion(protagonista.position())}).forEach({objeto =>objeto.activarAccionPrimaria(protagonista)})}

		keyboard.a().onPressDo{lista.filter({objeto=> objeto.puedeActivarAccion(protagonista.position())}).forEach({objeto =>objeto.activarAccionSecundaria(protagonista)})}
}	
	method configurarVisual(){
		game.addVisual(self)
		self.configurarObjetos()
	}
	method configurarObjetos(){
		lista.forEach{objeto => objeto.configurarVisual()}
	}
	method borrarse(){
		lista.forEach{objeto => objeto.borrarSuVisual()}
		game.removeVisual(self)
		removido = true
	}
}

class Boleta inherits Mapa{
	var property x = 0
	method agregarObjetosCarrito(){
	carrito.comidas().take(10).forEach{comida => comida.configurarVisual(x,8) self.calcularPocicion()}
	x=0
	}
	method calcularPocicion(){
		x +=1
	}
}

const living = new Mapa(lista= [pc,cama,cocina,puertaEntradaBanio,salida,heladera,calendario,mostrarTeclas],imagen = "Piso.png")
const banio = new Mapa (lista = [lavamanos,inodoro,puerta],imagen = "fondo-baño.jpg")
const oficina = new Mapa(lista =[pcOficina,salidaOficina,mateAgeno],imagen = "oficina.png" )
const superMercado = new Mapa(lista = [jojaColaSuper,jojoPizzaSuper,frutaSuper,comidaBarataSuper,basura,caja,cajera,ahorrador,salidaSuper,carameloRaro,curaCorona,alcoholGel], imagen = "superMercado.png")
const boleta = new Boleta(lista = [salidaBoleta,borrarCarrito,saldo,cobrar], imagen = "Boleta.png")



