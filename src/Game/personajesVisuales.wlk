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
	method comer(){
		personaje.comer()
		game.say(self,"Comiendo :D")
	}
	method tengoCorona() {             //Me da Corona q resta salud sobre tiempo
		if(personaje.higieneBaja())
		  game.onTick(20000, "modifica salud cada 20 segundos", {personaje.efectoCorona()})
	}
	method morir(){
		return personaje.morir()
	}
	method cambiarPosicion(posicionNueva){
		position = posicionNueva
	}

}
