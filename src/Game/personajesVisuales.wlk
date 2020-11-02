import wollok.game.*
import acciones.*
import stats.*
import trabajos.*
import juanTamagochi.*
import mapas.*

object personajePrincipal {
	var property position = game.origin()
	var property trabajoActual = trabajos.listaTrabajos().head()
	var puedeCambiarDeTrabajo=true
	
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
		trabajoActual.trabajar()
		game.say(self,"Trabajo desde casa :D")
	}
	method cambiarDeTrabajo(){
		if(puedeCambiarDeTrabajo){
			game.removeVisual(trabajoActual)
			trabajos.listaTrabajos().add(trabajoActual)
			trabajos.listaTrabajos().remove(trabajoActual)
			trabajoActual=trabajos.listaTrabajos().head()
			game.say(self,"Mi trabajo ahora es: "+trabajoActual.nombre())
			self.configurarVisualTrabajo()
			puedeCambiarDeTrabajo=false
			game.onTick(30000,"cambio trabajo",{puedeCambiarDeTrabajo=true})
			}
	} 
	method configurarVisualTrabajo(){
		game.addVisual(trabajoActual)
	}
	method comprarComida(){
		personaje.comprarComida()
		game.say(self,"Me pido una pizza :D")
		}
	method salir(){
		personaje.salir()
		game.say(self,"Voy de shopping :D")
	}
	method movermeAlSuper(){
		juanTamagochi.modificarMapa(mapas.superMercadoJoJo(),game.at(1,1))
	}
	method movermeAOficina(){
		juanTamagochi.modificarMapa(mapas.oficina(),game.at(8,0))
	}
	method movermeAlBanio(){
		juanTamagochi.modificarMapa(mapas.banioDeLaCasa(),game.at(0,1))
	}
	method volverACasa(){
		juanTamagochi.modificarMapa(mapas.livingDeLaCasa(),game.at(1,5))
	}
	method salirDelBanio(){
		juanTamagochi.modificarMapa(mapas.livingDeLaCasa(),game.at(6,11))
	}	
	/*method trabajarFuera(){
		personaje.trabajarFuera()
		game.say(self,"Voy a trabajar :c")
	}*/
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
		const cantidad = (lista.filter({objeto => objeto.nombre() == producto}).size())
		game.say(self,"Tengo " + cantidad.toString() + " " + producto.toString() +"s")
	}
	method plataActual(){
		game.say(self,"Me quedan " + statsDelJuego.cantidadPlata().toString() + " mangos")
	}
	method estadoActual(){
		game.say(self,"Mi salud " + statsDelJuego.saludDePersonaje().cantidad().toString())
		game.say(self,"Mi humor " + statsDelJuego.humorDePersonaje().cantidad().toString())
		game.say(self,"Mi higiene " + statsDelJuego.higieneDePersonaje().cantidad().toString())
		game.say(self,"Mi hambre " + statsDelJuego.saciedadDePersonaje().cantidad().toString())
	}
	
}
