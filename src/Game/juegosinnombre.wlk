import puertaentradabanio.*
import personajesVisuales.*
import humor.*
import salud.*
import wollok.game.*

object juegoSinNombre {
	const protagonista = personajePrincipal
	
	method jugar() {
		self.configurarTableroYPersonaje()
		self.configurarStats()
		game.start()
	}
	method configurarTableroYPersonaje(){
		self.configurarTablero()
		self.configurarPersonaje() // Aca vamos a poner mas cosas como self.configurarTeclas() por el momento no necesitamos mas
	}
	method configurarStats(){
		self.configurarHumor()
		self.configurarSalud()
		self.configurarAmbiente()
	}
	method configurarHumor(){
		game.addVisual(humorDePersonaje)
	}
	method configurarSalud(){
		game.addVisual(saludDePersonaje)
	}
	method configurarPersonaje() {
		game.addVisualCharacter(protagonista) 
		game.say(protagonista,protagonista.saludo()) //Imprime el mensaje de prueba, lo podemos borrar
		game.onTick(2000,"disminuye humor cada 2 seg",{protagonista.disminuirHumor()})
		game.onTick(3000,"disminuye salud cada 3 seg",{protagonista.disminuirSalud()})
	}
	method configurarAmbiente(){
		game.addVisual(puertaEntradaBanio)
	}
	method configurarTablero() {
		game.width(15)
		game.height(15)
		game.title("INVENTAR NOMBRE") // No tenemos nombre todavía :(
	}
}

