import wollok.game.*
import acciones.*
import stats.*

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
		  game.onTick(30000, "modifica salud cada 30 segundos", {personaje.efectoCorona()})
	}
	method morir(){
		return personaje.morir()
	}
	method cambiarPosicion(posicionNueva){
		position = posicionNueva
	}
	method cantidadDe(lista,producto){
		const cantidad = (lista.filter({objeto => objeto.nombre() == producto})).size()
		game.say(self,"Tengo " + cantidad + " " + producto +"s")
	}
	method plataActual(){
		game.say(self,"Me quedan " + stats.cantidadPlata() + " mangos")
	}
	method estadoActual(){
		game.say(self,"Mi salud " + statsDelJuego.saludDePersonaje().cantidad())
		game.say(self,"Mi humor " + statsDelJuego.humorDePersonaje().cantidad())
		game.say(self,"Mi higiene " + statsDelJuego.higieneDePersonaje().cantidad())
		game.say(self,"Mi hambre " + statsDelJuego.saciedadDePersonaje().cantidad())
	}
}
