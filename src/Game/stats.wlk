import wollok.game.*
import acciones.*

object stats {
	var property cantidadPlata = 0
	var property dias = 0
	
	method modificarPlata(cantidad){
		cantidadPlata += cantidad // modifica plata en cantidad ingresada
	}
}
class Stat{
	var property cantidad
	var property tieneLimite = true
	const property x
	const property y
	var property position = game.origin()
	const property buenaImagen
	const property mediaImagen
	const property malaImagen
	
	method modificarCantidad(cantidadQueModifica){
		if(tieneLimite){
			cantidad = (cantidad +cantidadQueModifica).min(100)
		}
		else {
			cantidad += cantidadQueModifica
		}
		return cantidad
	}
	method visualCorrespondida(){
		position=game.at(x,y)
		if(cantidad >= 70)
			return buenaImagen 
		if(cantidad.between(30,69))
			return mediaImagen 
        if(cantidad.between(0,29))
			return malaImagen 
		return "muerto.jpg"
	}
	method image() = self.visualCorrespondida()
}
object statsDelJuego {
	const property saludDePersonaje = new Stat (cantidad = 100,x=14,y=12,buenaImagen="corazonLleno.png",mediaImagen="corazonMitad.png",malaImagen="corazonVacio.png")
	const property energiaDePersonaje = new Stat (cantidad=100,x=14,y=11,buenaImagen="energiaLlena.jpg",mediaImagen="energiaMitad.jpg",malaImagen="energiaVacia.jpg")
	const property humorDePersonaje = new Stat (cantidad = 100,x=14,y=14,buenaImagen="feliz.jpg",mediaImagen="neutral.jpg",malaImagen="triste.jpg")
	const property higieneDePersonaje = new Stat (cantidad=100,x=14,y=13,buenaImagen="buenasalud.jpg",mediaImagen="malaSalud.jpg",malaImagen="malaSalud.jpg")
	const property saciedadDePersonaje = new Stat (cantidad=100,x=14,y=10,buenaImagen="Pizza.jpg",mediaImagen="PizzaCortada.jpg",malaImagen="PizzaPorcion.jpg")
	const property listaDeStats = [saludDePersonaje,energiaDePersonaje,humorDePersonaje,higieneDePersonaje,saciedadDePersonaje,coronavirusDePersonaje]
	method configurarAfeccionesDeStats(){
		game.onTick(20000,"disminuye humor cada 20 seg",{self.humorDePersonaje().modificarCantidad(-5)}) 
		game.onTick(30000,"disminuye higiene cada 30 seg",{self.higieneDePersonaje().modificarCantidad(-10)})
		game.onTick(30000,"disminuye hambre cada 30 seg",{self.saciedadDePersonaje().modificarCantidad(-10)})
	}
}

object coronavirusDePersonaje{
    const property position = game.at(14,9)
    var property contagiado = false //
    method contagiado(){
        return personaje.salio() && statsDelJuego.higieneDePersonaje().cantidad() <= 20 && statsDelJuego.humorDePersonaje().cantidad() <= 20 
    }

    method visual(){
        if(self.contagiado())
            return "corona.png"
        return "feliz.jpg"
}
    method image() = self.visual()
}