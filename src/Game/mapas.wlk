import wollok.game.*
import objetos.*
import Banio.*
import stats.*
import juanTamagochi.*

class Mapa {
	
	var property mapaActual
	var property teclas
	method configurar(protagonista){
		self.configurarFondo()
		self.configurarObjetos()
		self.configurarTeclas(protagonista)
//		self.trabajarPc(protagonista)
		game.addVisualCharacter(protagonista)
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
	method cambioDeMapa(protagonista){
		mapaActual.lista().forEach{objeto => game.removeVisual(objeto)}
		game.removeVisual(mapaActual)
		game.removeVisual(protagonista)
	}
}
const livingDeLaCasa = new Mapa (mapaActual=living,teclas=teclasDeLiving)
const banioDeLaCasa = new Mapa (mapaActual=banio,teclas=teclasDeBanio)

object teclasDeLiving{
	method configurarTeclas(protagonista){
		keyboard.s().onPressDo({if(protagonista.position() == cama.position()){protagonista.domrir()}})
		keyboard.s().onPressDo({if(protagonista.position() == pc.position()){protagonista.trabajar()}})
		keyboard.a().onPressDo({if(protagonista.position() == pc.position()){protagonista.comprarComida()}})
		keyboard.s().onPressDo({if(protagonista.position() == salida.position()){protagonista.salir()}})
		keyboard.a().onPressDo({if(protagonista.position() == salida.position()){protagonista.trabajarFuera()}})
		keyboard.s().onPressDo({if(protagonista.position() == puertaEntradaBanio.position()){
																	juanTamagochi.modificarMapa(banioDeLaCasa,(game.origin()))
		}})}
 }
 object teclasDeBanio{
 	method configurarTeclas(protagonista){
 		keyboard.s().onPressDo({if(protagonista.position() == lavamanos.position())protagonista.lavarseLasManos()})
 		keyboard.d().onPressDo({if(protagonista.position() == inodoro.position()) protagonista.defecar()})
 		keyboard.space().onPressDo({if(protagonista.position()==banio.position()){ 
 											juanTamagochi.modificarMapa(livingDeLaCasa,(puertaEntradaBanio.position()))}
 		})
	}
 }

