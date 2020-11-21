import wollok.game.*
import objetos.*
import juanTamagochi.*
import productos.*

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
const superMercado = new Mapa(lista = [new ObjetoVisual(x=7,y=11,imagen="jojoPizza.png",accionPrimaria={personaje => personaje.agregarComida(new Producto(nombre = "Pizza", precio = 300, valorEnergia = -5, valorHumor = 10, valorSaciedad = 100, valorHigiene = -5, valorSalud = -5,imagen="Pizza.jpg"))},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Pizza")}),
										new ObjetoVisual(x=2,y=7,imagen="jojaCola.png",accionPrimaria={personaje => personaje.agregarComida(new Producto(nombre = "JojaCola", precio = 100, valorEnergia = 10, valorHumor = 10, valorSaciedad = 10, valorHigiene = -5, valorSalud = -5,imagen="lata.png"))},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"JojaCola")}),
										new ObjetoVisual(x=2,y=11,imagen="fruta.png",accionPrimaria={personaje => personaje.agregarComida(new Producto(nombre = "Fruta", precio = 200, valorEnergia = 10, valorHumor = -5, valorSaciedad = 80, valorHigiene = -5, valorSalud = 10,imagen="frutita.png"))},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Fruta")}),
										new ObjetoVisual(x=7,y=7,imagen="comidaBarata.png",accionPrimaria={personaje => personaje.agregarComida(new Producto(nombre = "ComidaBarata", precio = 100, valorEnergia = -5, valorHumor = -5, valorSaciedad = 50, valorHigiene = -5, valorSalud = -10,imagen="comidabaratata.png"))},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Comida barata")}),
										new ObjetoVisual(x=11,y=5,imagen="basura.png",accionPrimaria={personaje => personaje.vaciarCarrito()}),
										//new ObjetoVisual(x=1,y=3,imagen="Punto.png",accionPrimaria={personaje=>personaje.informarMontoYCantidad(cajera)}), NO HACE FALTA LA ACCION DE LA CAJERA EN EL SUPER
										new ObjetoVisual(x=4,y=3,imagen="Punto.png",accionPrimaria={personaje => personaje.movermeABoleta()}),
										new ObjetoVisual(x=11,y=10,imagen="ahorradorT.png",accionPrimaria={personaje => personaje.seleccionarBarato()}),
										new ObjetoVisual(x=1,y=0,imagen="alfombra.png",accionPrimaria={personaje => personaje.volverACasa()}),
										new ObjetoVisual(x=7,y=3,imagen="CarameloRaro.png",accionPrimaria={personaje => personaje.comprarCaramelo()}),
										new ObjetoVisual(x=7,y=5,imagen="curaCorona.jpg",accionPrimaria={personaje => personaje.agregarComida(new CuraTotal(nombre = "CuraTotal", precio = 2000, valorEnergia = 0, valorHumor = 0, valorSaciedad = 0, valorHigiene = 0, valorSalud = 0,imagen="curaCorona.jpg"))}),
										new ObjetoVisual(x=7,y=1,imagen="buenaSalud.jpg",accionPrimaria={personaje => personaje.agregarComida(new Producto(nombre = "AlcoholEnGel", precio = 200, valorEnergia = 0, valorHumor = 0, valorSaciedad = 0, valorHigiene = 50, valorSalud = 0,imagen="buenaSalud.jpg"))})],
										imagen = "superMercado.png")
const boleta = new Boleta(lista = [salidaBoleta,borrarCarrito,saldo,cobrar], imagen = "Boleta.png")


