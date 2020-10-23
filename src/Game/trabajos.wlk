import stats.*
import acciones.*
import wollok.game.*

class Trabajos {
	var property sueldo 
	var property imagen
	const energiaqconsume
	const humorqconsume
	const property position = game.at(14,8)
	
	
	method image() = imagen
	
	
	method trabajar(){
		personaje.trabajar(humorqconsume, sueldo, energiaqconsume)
	}
}

object trabajos{
	
	const property desarrollador = new Trabajos(sueldo = 800, energiaqconsume = -30, humorqconsume = -30, imagen = "programador.png")
	const property tecnicoPC = new Trabajos(sueldo = 400, energiaqconsume = -30, humorqconsume = -10, imagen = "reparadorPC.jpg")
		
	var property listaTrabajos = [desarrollador, tecnicoPC]

	
}


