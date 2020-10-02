import wollok.game.*
import objetos.*

class Mapa {
	
	var property mapaActual
	var property teclas
	method configurar(protagonista){
		self.configurarFondo()
		self.configurarObjetos()
		self.configurarTeclas(protagonista)
	}
	method configurarFondo(){
		game.addVisual(mapaActual)
	}
	method configurarObjetos(){
		mapaActual.lista().forEach{objeto => game.addVisual(objeto)}
	}
	method configurarTeclas(protagonista){
		teclas.configurarTeclas(protagonista)
	}
}
const livingDeLaCasa = new Mapa (mapaActual=living,teclas=teclasDeLiving)

object teclasDeLiving{
	method configurarTeclas(protagonista){
		keyboard.s().onPressDo({if(protagonista.position() == cama.position()){protagonista.domrir()}})
	}
}