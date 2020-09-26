import personajesVisuales.*
import wollok.game.*

object juegoSinNombre {
	const protagonista = personajePrincipal
	
	method jugar() {
		self.configurar()
		game.start()
	}
	method configurar(){
		self.configurarVentana()
		self.configurarPersonaje() // Aca vamos a poner mas cosas como self.configurarTeclas() por el momento no necesitamos mas
	}
	method configurarPersonaje() {
		game.addVisualCharacter(protagonista)
		game.say(protagonista,protagonista.saludo())
	}
	
	method configurarVentana() {
		game.width(15)
		game.height(15)
		game.title("INVENTAR NOMBRE") // No tenemos nombre todavía :(
	}
}

