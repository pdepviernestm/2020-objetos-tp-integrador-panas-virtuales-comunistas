import stats.*
import acciones.*
import wollok.game.*

class Trabajos {
	var property sueldo 
	var property imagen
	const energiaqconsume
	const humorqconsume
	const property position = game.at(14,8)
	const property nombre 
	const property trabajaEnCasa = false
	method image() = imagen
	
	
	method trabajar(){
		personaje.trabajar(humorqconsume, sueldo, energiaqconsume)
	}
}

object trabajos{

	const property desarrollador = new Trabajos(nombre="desarrollador",sueldo = 800, energiaqconsume = -30, humorqconsume = -30, imagen = "programador.png", trabajaEnCasa = true)
	const property tecnicoPC = new Trabajos(nombre="Tecnico de PC", sueldo = 400, energiaqconsume = -30, humorqconsume = -10, imagen = "reparadorPC.jpg",trabajaEnCasa = false)
		
	var property listaTrabajos = [desarrollador, tecnicoPC]
}


