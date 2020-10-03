import objetos.*
import personajesVisuales.*
import stats.*
import wollok.game.*
import mapas.*

object juanTamagochi {
	const protagonista = personajePrincipal
	var property mapaActual = livingDeLaCasa
	const listaDeStats=[humorDePersonaje,higieneDePersonaje,saludDePersonaje,coronavirusDePersonaje]
	method jugar() {
		self.configurar()
		game.start()
	}
	method configurar(){
		self.configurarTablero()
		//self.configurarStats()
		self.configurarPersonaje()
	}
	method configurarTablero() {
		game.width(15)
		game.height(15)
		self.configurarMapa()
		game.title("Juan Tamgochi") 
	}
	method configurarMapa(){
		mapaActual.configurar(protagonista)
		self.configurarStats()
	}
	method modificarMapa(nuevoMapa,ubicacion){
		mapaActual.cambioDeMapa(protagonista)
		mapaActual= nuevoMapa
		listaDeStats.forEach{stat => game.removeVisual(stat)}
		personajePrincipal.cambiarPosicion(ubicacion)
		self.configurarTablero()
	}
	method configurarStats(){
		self.configurarHumor()
		self.configurarHigiene()
		self.configurarSalud()
		self.contagiado()
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
	method contagiado(){
        game.addVisual(coronavirusDePersonaje)
    }
	method muerto(personaje){ // METODO PARA ELIMINAR AL PERSONAJE VISUAL
		if(stats.muerte())
			self.sacarPersonaje(personaje)
	}
	method sacarPersonaje(personaje){
		spawner.despawnear(personaje)
	}
	method configurarPersonaje() {
		//game.addVisualCharacter(protagonista) 
		game.say(protagonista,protagonista.saludo()) //Imprime el mensaje de prueba, lo podemos borrar
		game.onTick(20000,"disminuye humor cada 20 seg",{stats.modificarHumor(-5)})
		game.onTick(30000,"disminuye higiene cada 30 seg",{stats.modificarHigiene(-10)})
//		game.onTick(20000, "modifica salud cada 20 segundos", {stats.modificarSalud()})
		game.onTick(30000,"disminuye hambre cada 30 seg",{stats.modificarHambre(-10)})
		game.onTick(100,"verificar si muere",{if(game.hasVisual(protagonista)) self.muerto(protagonista)}) // MATA A JUAN :( pd: Cuando se muere rompe todo)
	}	
}

object spawner {
	method despawnear(personaje){
		game.removeVisual(personaje)		
	}
}