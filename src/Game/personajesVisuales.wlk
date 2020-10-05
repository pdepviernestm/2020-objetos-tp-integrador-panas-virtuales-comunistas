import wollok.game.*
import acciones.*

object personajePrincipal {
	var property position = game.origin()
	
	method image() = "avatar.png" 
	method saludo() = "Hola! :D" // Mensaje de prueba
	method dormir(){
		personaje.dormir()
		game.say(self,"Zzz...")
	}
	method lavarseLasManos(){
		personaje.lavarseLasManos()
		game.say(self,"Me lavo las manos :D")
	}
	method defecar(){
		personaje.defecar()
		game.say(self,"Usando el trono :D")
	}
	method trabajar(){
		personaje.trabajar()
		game.say(self,"Trabajo desde casa :D")
	}
	method comprarComida(){
		personaje.comprarComida()
		game.say(self,"Me pido una pizza :D")
		}
	method salir(){
		personaje.salir()
		game.say(self,"Voy de shopping :D")
	}
	method trabajarFuera(){
		personaje.trabajarFuera()
		game.say(self,"Voy a trabajar :c")
	}
	method cambiarPosicion(posicionNueva){
		position = posicionNueva
	}

}
