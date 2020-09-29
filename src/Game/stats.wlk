import wollok.game.*

object stats {
	
	var property estadoEmocional = 100
	var property cantidadSalud = 100
	
	method humor(){
		if(estadoEmocional >= 70)
			return "feliz.jpg"
		if(estadoEmocional >= 30 && estadoEmocional < 70)
			return "neutral.jpg"
		if(estadoEmocional >= 0 && estadoEmocional <30)
			return "triste.jpg"
		return "muerto.jpg"
	}
	method salud(){
		if(cantidadSalud>=50)
			return "buenaSalud.jpg"
		if(cantidadSalud>0 && cantidadSalud<50)
			return "malaSalud.jpg"
		return "muerte.jpg"
	}
		method disminuirHumor(){
		estadoEmocional -=5 // disminuye humor en 5
	}
	
	method disminuirSalud(){
		cantidadSalud -=10
	}
	
	
}


object humorDePersonaje {
	const property position = game.at(14,14)
	method image()= stats.humor()
}

object saludDePersonaje {
	const property position = game.at(14,13)
	method image() = stats.salud()
}

