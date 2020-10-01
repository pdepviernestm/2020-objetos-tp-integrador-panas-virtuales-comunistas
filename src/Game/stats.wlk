import wollok.game.*

object stats {
	
	var property estadoEmocional = 100
	var property cantidadHigiene = 60
	var property cantidadSalud = 100
		
	method humor(){
		if(estadoEmocional >= 70)
			return "feliz.jpg"
		if(estadoEmocional.between(30,69))
			return "neutral.jpg"
		if(estadoEmocional.between(0,29))
			return "triste.jpg"
		return "muerto.jpg"
	}
	method higiene(){
		if(cantidadHigiene>=50)
			return "buenaSalud.jpg"
		if(cantidadHigiene.between(0,49))
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
		if(cantidadSalud >= 50)
			return "corazonLLeno.png" 
		if(cantidadSalud.between(0,49))
			return "corazonMitad.png" 
		return "corazonVacio.png" 
	}
	method modificarSalud(){
		if(cantidadHigiene >= 70 )
			 cantidadSalud += 30
		if(cantidadHigiene.between(20,50))
			 cantidadSalud -= 30
		if(cantidadHigiene < 20)
			cantidadSalud -= 50
	}
	method muerte(){ // Booleano para matar al personaje
		return cantidadHigiene <= 0 || cantidadSalud <= 0
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

