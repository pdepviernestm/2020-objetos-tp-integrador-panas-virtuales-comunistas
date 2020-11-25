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
const living = new Mapa(lista= [
								new ObjetoVisual(x=7,y=11,imagen="puertaBaño.jpg",accionPrimaria={personaje => personaje.movermeAlBanio()}),
								new ObjetoVisual(x=13,y=11,imagen="PC.jpg",accionPrimaria={personaje => personaje.trabajarEnCasa()} ,accionSecundaria={personaje => personaje.delivery()} ),
								new ObjetoVisual(x=7,y=7,imagen="cama.jpg",accionPrimaria={personaje => personaje.dormir()}),
								new ObjetoVisual(x=3,y=11,imagen="cocina.jpg",accionPrimaria={personaje => personaje.comer()}),
								new ObjetoVisual(x=0,y=5,imagen="salidaLiving.jpg",accionPrimaria={personaje => personaje.movermeA(superMercado,1,1)},accionSecundaria={personaje => personaje.movermeA(oficina,8,0)}),
								new ObjetoVisual(x=5,y=11,imagen="heladera.png"),
								new ObjetoVisual(x=10,y=11,imagen="Punto.png",accionPrimaria={personaje => personaje.contarDias()}),
								new ObjetoVisual(x=11,y=7,imagen="arcade.png",accionPrimaria={personaje => personaje.jugar()}),
								mostrarTeclas
								],
								imagen = "Piso.png")
const banio = new Mapa (lista = [
								new ObjetoVisual(x=3,y=2,imagen="lavaManos.jpg",accionPrimaria={personaje=>personaje.lavarseLasManos()}),
								new ObjetoVisual(x=9,y=2,imagen="inodoro.jpg",accionPrimaria={personaje=>personaje.defecar()}),
								new ObjetoVisual(x=0,y=0,imagen="Punto.png",accionPrimaria={personaje=>personaje.salirDelBanio()})
								],
								imagen = "fondo-baño.jpg")
const oficina = new Mapa(lista =[
								new ObjetoVisual(x=1,y=8,imagen="punto.png",accionPrimaria={protagonista=>protagonista.trabajar()}),
								new ObjetoVisual(x=8,y=0,imagen="punto.png",accionPrimaria={personaje=>personaje.volverACasa()}),
								new ObjetoVisual(x=3,y=8,imagen="mateAgeno.jpg",accionPrimaria={personaje=>personaje.meContagie()})
								],
								imagen = "oficina.png" )
const superMercado = new Mapa(lista = [new ObjetoVisual(x=7,y=11,imagen="jojoPizza.png",accionPrimaria={personaje => personaje.agregarProducto(new Producto(nombre = "Pizza", precio = 300, valorEnergia = -5, valorHumor = 10, valorSaciedad = 100, valorHigiene = -5, valorSalud = -5,imagen="Pizza.jpg"))},accionSecundaria={personaje => personaje.cantidadDe("Pizza")}),
										new ObjetoVisual(x=2,y=7,imagen="jojaCola.png",accionPrimaria={personaje => personaje.agregarProducto(new Producto(nombre = "JojaCola", precio = 100, valorEnergia = 10, valorHumor = 10, valorSaciedad = 10, valorHigiene = -5, valorSalud = -5,imagen="lata.png"))},accionSecundaria={personaje => personaje.cantidadDe("JojaCola")}),
										new ObjetoVisual(x=2,y=11,imagen="fruta.png",accionPrimaria={personaje => personaje.agregarProducto(new Producto(nombre = "Fruta", precio = 200, valorEnergia = 10, valorHumor = -5, valorSaciedad = 80, valorHigiene = -5, valorSalud = 10,imagen="frutita.png"))},accionSecundaria={personaje => personaje.cantidadDe("Fruta")}),
										new ObjetoVisual(x=7,y=7,imagen="comidaBarata.png",accionPrimaria={personaje => personaje.agregarProducto(new Producto(nombre = "ComidaBarata", precio = 100, valorEnergia = -5, valorHumor = -5, valorSaciedad = 50, valorHigiene = -5, valorSalud = -10,imagen="comidabaratata.png"))},accionSecundaria={personaje => personaje.cantidadDe("ComidaBarata")}),
										new ObjetoVisual(x=11,y=5,imagen="basura.png",accionPrimaria={personaje => personaje.vaciarCarrito()}),
										new ObjetoVisual(x=4,y=3,imagen="Punto.png",accionPrimaria={personaje => personaje.movermeABoleta()}),
										new ObjetoVisual(x=11,y=10,imagen="ahorradorT.png",accionPrimaria={personaje => personaje.seleccionarBarato()}),
										new ObjetoVisual(x=1,y=0,imagen="alfombra.png",accionPrimaria={personaje => personaje.volverACasa()}),
										new ObjetoVisual(x=7,y=3,imagen="CarameloRaro.png",accionPrimaria={personaje => personaje.comprarCaramelo()}),
										new ObjetoVisual(x=7,y=5,imagen="curaCorona.jpg",accionPrimaria={personaje => personaje.agregarProducto(new CuraTotal(nombre = "CuraTotal", precio = 2000, imagen="curaCorona.jpg"))}),
										new ObjetoVisual(x=7,y=1,imagen="buenaSalud.jpg",accionPrimaria={personaje => personaje.agregarProducto(new Producto(nombre = "AlcoholEnGel", precio = 200, valorEnergia = 0, valorHumor = 0, valorSaciedad = 0, valorHigiene = 50, valorSalud = 0,imagen="buenaSalud.jpg"))})],
										imagen = "superMercado.png")
object boleta inherits Mapa{
	var property x = 0
	const property cajera = new ObjetoVisual(x=10,y=5,imagen="cajera.jpg",accionPrimaria={personaje=>personaje.informarMontoYCantidad(cajera)})
	override method image()="Boleta.png"
	override method configurarVisual(){
		self.actualizarLista()
		super()
	}
	method actualizarLista(){
		lista=[
				new ObjetoVisual(x=3,y=2,imagen="alfombra.png",accionPrimaria={personaje => personaje.movermeA(superMercado,1,1)}),
				new ObjetoVisual(x=3,y=5,imagen="basura.png",accionPrimaria={personaje => personaje.vaciarCarrito()}),
				new ObjetoVisual(x=10,y=2,imagen="PC.jpg",accionPrimaria={personaje => personaje.cobrar()}),
				cajera
				]
	}
	method agregarObjetosCarrito(){
	carrito.productos().take(10).forEach{producto => producto.configurarVisual(x,8) self.calcularPocicion()}
	x=0
	}
	method calcularPocicion(){
		x +=1
	}
}

