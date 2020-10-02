import wollok.game.*
import acciones.*

object personajePrincipal {
	var property position = game.origin()
	
	method image() = "avatar.png" //"juan.jpg" 
	method saludo() = "Hola! :D" // Mensaje de prueba
	method domrir(){
		personaje.dormir()
		game.say(self,"Zzz...")
	}
	method lavarseLasManos(){
		personaje.lavarseLasManos()
		game.say(self,"Me lavo las manos :D")
	}
	method trabajar(){
		personaje.trabajar()
		game.say(self,"Trabajo desde casa :D")
	}
	method salir(){
		personaje.salir()
		game.say(self,"Voy de shopping :|")
	}
	method trabajarFuera(){
		personaje.trabajarFuera()
		game.say(self,"Voy a trabajar :c")
	}
	method defecar(){
		personaje.defecar()
		game.say(self,"Usando el trono :D")
	}
}
