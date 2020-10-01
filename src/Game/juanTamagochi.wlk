import puertaentradabanio.*
import personajesVisuales.*
import stats.*
import wollok.game.*

object juanTamagochi {
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
		self.configurarHigiene()
		self.configurarAmbiente()
	}
	method configurarHumor(){
		game.addVisual(humorDePersonaje)
	}
	method configurarHigiene(){
		game.addVisual(higieneDePersonaje)
	}
	method configurarSalud(){
		game.addVisual(saludDePersonaje)
	}
	method configurarPersonaje() {
		game.addVisualCharacter(protagonista) 
		game.say(protagonista,protagonista.saludo()) //Imprime el mensaje de prueba, lo podemos borrar
		game.onTick(20000,"disminuye humor cada 20 seg",{stats.disminuirHumor()})
		game.onTick(30000,"disminuye higiene cada 30 seg",{stats.disminuirHigiene()})
		game.onTick(2000, "modifica salud cada 2 segundos", {stats.modificarSalud()})
	}
	method configurarAmbiente(){
		game.addVisual(puertaEntradaBanio)
		game.addVisual(pc)
		game.addVisual(cama)
		game.addVisual(cocina) 
	}
	method configurarTablero() {
		game.width(15)
		game.height(15)
		game.boardGround("Piso.png")
		game.title("juanTamgochi") 
	}
}

