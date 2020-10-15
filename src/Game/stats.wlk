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
	var property dias = 0
	
	method modificarHambre(cantidad){
		hambre += (cantidad).min(100) // modifica hambre en cantidad ingresada
	}
	method modificarPlata(cantidad){
		cantidadPlata += cantidad // modifica plata en cantidad ingresada
	}
	method modificarHumor(cantidad){
		estadoEmocional += (cantidad).min(100) // modifica humor en cantidad ingresada
	}
	method modificarHigiene(cantidad){
		cantidadHigiene += (cantidad).min(100)
	}
	method modificarEnergia(cantidad){
		cantidadEnergia += (cantidad).min(100)
	}
	method modificarSalud(cantidad){
		cantidadSalud += (cantidad).min(100)
	}
	method crearImagen(stat,img1,img2,img3){
		if(stat >= 70)
			return img1 
		if(stat.between(30,69))
			return img2 
        if(stat.between(0,29))
			return img3 
		return "muerto.jpg"
	}
	method contagiado(){
        return personaje.salio() && cantidadHigiene <= 20 && estadoEmocional <= 20 
    }

    method coronavirus(){
        if(self.contagiado())
            return "corona.png"
        return "feliz.jpg"
}
	method muerte(){ // Booleano para matar al personaje
		return cantidadSalud <= 0 || hambre <= 0 || estadoEmocional <= 0
	}
}

object saludDePersonaje{
	const property position = game.at(14,12)
	method image() = stats.crearImagen(stats.cantidadSalud(),"corazonLLeno.png","corazonMitad.png","corazonVacio.png")
}
object energiaDePersonaje{
	const property position = game.at(14,11)
	method image() = stats.crearImagen(stats.cantidadEnergia(),"energiallena.jpg","energiaMitad.jpg","energiaVacia.jpg")   
}
object humorDePersonaje {
	const property position = game.at(14,14)
	method image() = stats.crearImagen(stats.estadoEmocional(),"feliz.jpg","neutral.jpg","triste.jpg")
}
object higieneDePersonaje {
	const property position = game.at(14,13)
	method image() = stats.crearImagen(stats.cantidadHigiene(),"buenaSalud.jpg","malaSalud.jpg","malaSalud.jpg")
}
object coronavirusDePersonaje{
    const property position = game.at(14,9)
    method image() = stats.coronavirus()
}
object saciedadDePersonaje{
    const property position = game.at(14,10)
    method image() = stats.crearImagen(stats.hambre(),"Pizza.jpg","PizzaCortada.jpg","PizzaPorcion.jpg")
}
