import objetos.*
import personajesVisuales.*
import stats.*
import wollok.game.*
import mapas.*

object juanTamagochi {
	const property protagonista = personajePrincipal
	var property mapaActual = mapas.livingDeLaCasa()
	const listaDeStats=statsDelJuego.listaDeStats()
	method jugar() {
		self.configurar()
		game.start()
	}
	method configurar(){
		self.configurarTablero()
		self.configurarPersonaje()
	}
	method configurarTablero() {
		game.width(15)
		game.height(15)
		self.configurarMapa()
		game.title("Juan Tamagochi") 
	}
	method agregarVisualStats(){
		listaDeStats.forEach{stat => game.addVisual(stat)}
	}
	method borrarVisualStats(){
		listaDeStats.forEach{stat => game.removeVisual(stat)}
	}
	method configurarMapa(){
		mapaActual.configurar()
		self.agregarVisualStats()
	}
	method modificarMapa(nuevoMapa,ubicacion){
		mapaActual.cambioDeMapa(protagonista)
		mapaActual= nuevoMapa
		self.borrarVisualStats()
		personajePrincipal.cambiarPosicion(ubicacion)
		self.configurarTablero()
		game.addVisual(protagonista)
	}
	method muerte(personaje){ // METODO PARA ELIMINAR AL PERSONAJE VISUAL
		if(personaje.morir())
			self.sacarPersonaje(personaje)
	}
	method sacarPersonaje(personaje){
		spawner.despawnear(personaje)
	}
	method configurarPersonaje(){
		game.addVisualCharacter(protagonista) 
		game.say(protagonista,protagonista.saludo()) //Imprime el mensaje de prueba, lo podemos borrar
		keyboard.p().onPressDo {protagonista.plataActual()}
		keyboard.t().onPressDo {protagonista.estadoActual()}
		statsDelJuego.configurarAfeccionesDeStats()
		game.onTick(100,"verificar si muere",{if(game.hasVisual(protagonista)) self.muerte(protagonista)}) // MATA A JUAN :( pd: Cuando se muere rompe todo)
	}

}

object spawner {
	method despawnear(personaje){
		game.removeVisual(personaje)		
	}
}