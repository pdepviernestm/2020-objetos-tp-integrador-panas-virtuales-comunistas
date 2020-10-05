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
//const  livingDeLaCasa = new Mapa(mapaActual=living)
//const  banioDeLaCasa = new Mapa(mapaActual=banio)

object mapas{
	method livingDeLaCasa()= new Mapa(mapaActual=living)
	method banioDeLaCasa()=new Mapa(mapaActual=banio)
	//const property livingDeLaCasa = new Mapa(mapaActual=living)
	//const property banioDeLaCasa = new Mapa(mapaActual=banio)
}


