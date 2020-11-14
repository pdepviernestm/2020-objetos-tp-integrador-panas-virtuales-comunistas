import objetos.*
import personajesVisuales.*
import stats.*
import wollok.game.*
import mapas.*

object juanTamagochi {                                                  // Nuestro Juego
	const property protagonista = personajePrincipal
	var property mapaActual = living
	const listaDeStats=statsDelJuego.listaDeStats()
	var property mostrarStats = false
	var property contador = 0
	
	method jugar() {                                                    // Usa configurar y empieza el juego
		self.configurar()
		game.start()
	}
	method configurar(){                                                // Configura el tablero y el personaje
		self.configurarTablero()
		self.configurarPersonaje()
	}
	method configurarTablero() {                                        // Caracteristicas del tablero y arranca confMapa
		game.width(15)
		game.height(15)
		self.configurarMapa()
		game.title("Juan Tamagochi") 
	}
	method configurarMapa(){                                              // Configura el mapa(Hay q cambiar stats)
		mapaActual.configurar()
        self.agregarVisualStats()
	}
	method modificarMapa(nuevoMapa,ubicacion){
		mapaActual.cambioDeMapa(protagonista)
		mapaActual= nuevoMapa
		self.borrarVisualStats()
		personajePrincipal.cambiarPosicion(ubicacion)
		game.clear()
		self.configurar()
	}
	method agregarVisualStats(){                                         // Agrega Visual de stats
	if (mostrarStats)
		listaDeStats.forEach{stat => game.addVisual(stat)}
	}
	method borrarVisualStats(){                                           // Lo borra
	if (mostrarStats)
		listaDeStats.forEach{stat => game.removeVisual(stat)}
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
		protagonista.configurarVisualTrabajo() 
		keyboard.p().onPressDo {protagonista.plataActual()}
    	keyboard.t().onPressDo {self.mostrandoStats()}
    	keyboard.m().onPressDo {if(!game.hasVisual(mochila)) mochila.abrir() else {mochila.cerrar()}}
    	keyboard.h().onPressDo {self.mostrandoAyuda()}
		statsDelJuego.configurarAfeccionesDeStats()
		game.onTick(100,"verificar si muere",{if(game.hasVisual(protagonista)) self.muerte(protagonista)}) // MATA A JUAN :( pd: Cuando se muere rompe todo)
		keyboard.j().onPressDo{protagonista.cambiarDeTrabajo()}
		
	}
	method mostrandoStats() {
		contador = contador + 1
		if (contador.odd()){
		  mostrarStats = true
		  self.agregarVisualStats()
		  }
		else {
			self.borrarVisualStats()
			mostrarStats = false	
		} 
	}
	
	method mostrandoAyuda(){
		if(game.hasVisual(mostrarTeclas)){
			game.removeVisual(mostrarTeclas)
			living.lista().remove(mostrarTeclas)
		}
		else{
			game.addVisual(mostrarTeclas)
			living.lista().add(mostrarTeclas)
		}
	}

}

object spawner {
	method despawnear(personaje){
		game.removeVisual(personaje)		
	}
}