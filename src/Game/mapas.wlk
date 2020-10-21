import wollok.game.*
import objetos.*

class Mapa {
	
	var property mapaActual
	method configurar(){
		self.configurarFondo()
		self.configurarLasTeclas()
	}
	method configurarFondo(){
		mapaActual.configurarVisual()
	}
	method configurarLasTeclas(){
		mapaActual.configurarTeclas()
	}
	method cambioDeMapa(protagonista){
		mapaActual.borrarse()
		game.removeVisual(protagonista)
	}
}

object mapas{
	method livingDeLaCasa()= new Mapa(mapaActual=living)
	method banioDeLaCasa()=new Mapa(mapaActual=banio)
	//method superMercadoJoJo()=new Mapa(mapaActual=superMercado)
	method mapa() = new Mapa(mapaActual = mapaGeneral)
}


