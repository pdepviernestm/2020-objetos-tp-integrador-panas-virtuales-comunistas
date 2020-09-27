import personajesVisuales.*
import humor.*
import wollok.game.*

object juegoSinNombre {
	const protagonista = personajePrincipal
	
	method jugar() {
		self.configurar()
		game.start()
	}
	method configurar(){
		self.configurarVentana()
		self.configurarPersonaje()
		self.configurarHumor() // Aca vamos a poner mas cosas como self.configurarTeclas() por el momento no necesitamos mas
	}
	method configurarHumor(){
		game.addVisual(humorDePersonaje)
	}
	method configurarPersonaje() {
		game.addVisualCharacter(protagonista)
		game.say(protagonista,protagonista.saludo())
		game.onTick(2000,"disminuye humor",{protagonista.disminuirHumor()})
	}
	method configurarVentana() {
		game.width(15)
		game.height(15)
		game.title("INVENTAR NOMBRE") // No tenemos nombre todavía :(
	}
}

