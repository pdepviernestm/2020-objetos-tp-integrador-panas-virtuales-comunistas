import objetos.*
import personajesVisuales.*
import stats.*
import wollok.game.*

object juanTamagochi {
	const protagonista = personajePrincipal
	
	method jugar() {
		self.configurarStats()
		self.configurarTeclas()
		self.configurarTableroYPersonaje()
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
		self.configurarSalud()
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
	method configurarTeclas(){
		keyboard.s().onPressDo({if(protagonista.position() == cama.position()){protagonista.domrir()}})
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
		game.title("Juan Tamgochi") 
	}
	
	method muerto(personaje){ // METODO PARA ELIMINAR AL PERSONAJE VISUAL
		if(stats.muerte())
			self.sacarPersonaje(personaje)
	}
	method sacarPersonaje(personaje){
		spawner.despawnear(personaje)
	}
	method configurarPersonaje() {
		game.addVisualCharacter(protagonista) 
		game.say(protagonista,protagonista.saludo()) //Imprime el mensaje de prueba, lo podemos borrar
		game.onTick(20000,"disminuye humor cada 20 seg",{stats.modificarHumor(-5)})
		game.onTick(30000,"disminuye higiene cada 30 seg",{stats.modificarHigiene(-10)})
		game.onTick(20000, "modifica salud cada 20 segundos", {stats.modificarSalud()})
		game.onTick(100,"verificar si muere",{self.muerto(protagonista)}) // MATA A JUAN :( pd: Cuando se muere rompe todo
	}	
}

object spawner {
	method despawnear(personaje){
		game.removeVisual(personaje)		
	}
}

