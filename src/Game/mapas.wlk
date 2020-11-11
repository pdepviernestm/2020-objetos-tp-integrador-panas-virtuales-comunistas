import wollok.game.*
import objetos.*
import juanTamagochi.*

class Mapa {
	const protagonista = juanTamagochi.protagonista()
	var property lista
	var property removido = false
	const property position = game.origin()
	const property imagen
//	var property ultimoLugar = living
	
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
		keyboard.s().onPressDo{lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto =>objeto.activarAccionPrimaria(protagonista)})}

		keyboard.a().onPressDo{lista.filter({objeto=> objeto.activarAccion(protagonista.position())}).forEach({objeto =>objeto.activarAccionSecundaria(protagonista)})}
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

const living = new Mapa(lista= [pc,cama,cocina,puertaEntradaBanio,salida,heladera],imagen = "Piso.png")
const banio = new Mapa (lista = [lavamanos,inodoro,puerta],imagen = "fondo-baño.jpg")
const oficina = new Mapa(lista =[pcOficina,salidaOficina,mateAgeno],imagen = "oficina.png" )
const superMercado = new Mapa(lista = [jojaCola,jojoPizza,fruta,comidaBarata,basura,caja,cajera,ahorrador,salidaSuper,carameloRaro,curaCorona,alcoholGel], imagen = "superMercado.png")
const boleta = new Mapa(lista = [salidaBoleta,borrarCarrito,saldo,cobrar], imagen = "Boleta.png")
const interiorMochila = new Mapa(lista = mochila.comidas(),imagen = "interiorMochila.png")


/* 
object mapas{
	method livingDeLaCasa()= new Mapa(mapaActual=living)
	method banioDeLaCasa()=new Mapa(mapaActual=banio)
	method superMercadoJoJo()=new Mapa(mapaActual=superMercado)
	method mapa() = new Mapa(mapaActual = mapaGeneral)
	method oficina() = new Mapa(mapaActual=oficina)
}
*/

