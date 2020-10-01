import wollok.game.*

object stats {
	
	var property estadoEmocional = 100
	var property cantidadHigiene = 60
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
	method higiene(){
		if(cantidadHigiene>=50)
			return "buenaSalud.jpg"
		if(cantidadHigiene>0 && cantidadHigiene<50)
			return "malaSalud.jpg"
		return "muerte.jpg"
	}
		method disminuirHumor(){
		estadoEmocional -=5 // disminuye humor en 5
	}
	
	method disminuirHigiene(){
		cantidadHigiene -=10
	}
	method salud(){
		return "cajaa.jpg"
	}
	method modificarSalud(){
		if(cantidadHigiene >= 70 )
			return "cajaa.jpg"
		if(cantidadHigiene <= 50)
			return cantidadSalud - 30
		if(cantidadHigiene <= 20)
			return cantidadSalud - 50
		return "cajaa.jpg"
	}
}

object saludDePersonaje{
	const property position = game.at(14,12)
	method image() = stats.salud()
}


object humorDePersonaje {
	const property position = game.at(14,14)
	method image()= stats.humor()
}

object higieneDePersonaje {
	const property position = game.at(14,13)
	method image() = stats.higiene()
}

