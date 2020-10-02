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
}
