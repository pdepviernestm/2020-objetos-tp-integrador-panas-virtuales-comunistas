import wollok.game.*
import acciones.*

object stats {
	var property contagiado = false
	var property estadoEmocional = 100
	var property cantidadHigiene = 100
	var property cantidadSalud = 100
	var property cantidadEnergia = 100
	var property cantidadPlata = 0
	var property hambre = 100
	
	method modificarHambre(cantidad){
		hambre += cantidad // modifica hambre en cantidad ingresada
	}
	method modificarPlata(cantidad){
		cantidadPlata += cantidad // modifica plata en cantidad ingresada
	}
	method modificarHumor(cantidad){
		estadoEmocional += cantidad // modifica humor en cantidad ingresada
	}
	method modificarHigiene(cantidad){
		cantidadHigiene += cantidad
	}
	method modificarEnergia(cantidad){
		cantidadEnergia += cantidad
	}
	method modificarSalud(cantidad){
		cantidadSalud += cantidad
	}
	method contagiado(){
		return personaje.salio() && cantidadHigiene < 20 && estadoEmocional < 20 
	}
	method salud(){
		if(cantidadSalud >= 50)
			return "corazonLLeno.png" 
		if(cantidadSalud.between(0,49))
			return "corazonMitad.png" 
		return "corazonVacio.png" 
	}
    method coronavirus(){
        if(self.contagiado())
            return "corona.png"
        return "feliz.jpg"
    }
//	method modificarSalud(){                      // Me parecio incesesarion con el corona
//		if(cantidadHigiene >= 70 )
//			 cantidadSalud += 30
//		if(cantidadHigiene.between(20,50))
//			 cantidadSalud -= 30
//		if(cantidadHigiene < 20)
//			cantidadSalud -= 50
//	}
	method humor(){
		if(estadoEmocional >= 70)
			return "feliz.jpg"
		if(estadoEmocional.between(30,69))
			return "neutral.jpg"
		if(estadoEmocional.between(0,29))
			return "triste.jpg"
		return "muerto.jpg"
	}
	method energia(){
		if(cantidadEnergia >= 70)
			return "energiallena.jpg"
		if(cantidadEnergia.between(30,69))
			return "energiaMitad.jpg"
		if(cantidadEnergia.between(0,29))
			return "energiaVacia.jpg"
		return "muerto.jpg"
	}
	method higiene(){
		if(cantidadHigiene>=50)
			return "buenaSalud.jpg"
		if(cantidadHigiene.between(0,49))
			return "malaSalud.jpg"
		return "muerte.jpg"
	}

	method muerte(){ // Booleano para matar al personaje
		return cantidadSalud <= 0 || hambre <= 0 || estadoEmocional <= 0
	}
}

object saludDePersonaje{
	const property position = game.at(14,12)
	method image() = stats.salud()
}
object energiaPersonaje{
	const property position = game.at(14,11)
	method image() = stats.energia()
}

object humorDePersonaje {
	const property position = game.at(14,14)
	method image()= stats.humor()
}

object higieneDePersonaje {
	const property position = game.at(14,13)
	method image() = stats.higiene()
}
object energiaDePersonaje{
	//implementar visuales de energia
}
object coronavirusDePersonaje{
    const property position = game.at(14,10)
    method image() = stats.coronavirus()
}
