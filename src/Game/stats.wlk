import wollok.game.*
import acciones.*
import objetos.*


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
	var property cantidadPlata = 10000
	var property dias = 0
	
	
	const property saludDePersonaje = new Stat (cantidad = 100,x=14,y=12,buenaImagen="corazonLleno.png",mediaImagen="corazonMitad.png",malaImagen="corazonVacio.png")
	const property energiaDePersonaje = new Stat (cantidad=100,x=14,y=11,buenaImagen="energiaLlena.jpg",mediaImagen="energiaMitad.jpg",malaImagen="energiaVacia.jpg")
	const property humorDePersonaje = new Stat (cantidad = 10,x=14,y=14,buenaImagen="feliz.jpg",mediaImagen="neutral.jpg",malaImagen="triste.jpg")
	const property higieneDePersonaje = new Stat (cantidad=10,x=14,y=13,buenaImagen="buenasalud.jpg",mediaImagen="pocaSalud.jpg",malaImagen="malaSalud.jpg")
	const property saciedadDePersonaje = new Stat (cantidad=100,x=14,y=10,buenaImagen="Pizza.jpg",mediaImagen="PizzaCortada.jpg",malaImagen="PizzaPorcion.jpg")
	const property listaDeStats = [saludDePersonaje,energiaDePersonaje,humorDePersonaje,higieneDePersonaje,saciedadDePersonaje,coronavirusDePersonaje]
	method configurarAfeccionesDeStats(){
		game.onTick(20000,"disminuye humor cada 20 seg",{self.humorDePersonaje().modificarCantidad(-5)}) //-5
		game.onTick(30000,"disminuye higiene cada 30 seg",{self.higieneDePersonaje().modificarCantidad(-10)}) //30000 -10
		game.onTick(30000,"disminuye hambre cada 30 seg",{self.saciedadDePersonaje().modificarCantidad(-10)})
		game.onTick(5000,"proba. contagio",{self.activarProbabilidadDeContagio()}) 
	}
	method activarProbabilidadDeContagio(){
		if(coronavirusDePersonaje.estaEnCondicionesDeContagio()){ 
			game.removeTickEvent("proba. contagio")
			self.contagioAleatorio()
			//if(coronavirusDePersonaje.contagiado()==true) 
				//game.removeTickEvent("proba. contagio")
		}
	}
	method contagioAleatorio(){
		game.onTick(2000,"puede contagiarse",{coronavirusDePersonaje.analizarContagio() })
	}
	method modificarPlata(cantidad){
		cantidadPlata += cantidad // modifica plata en cantidad ingresada
	}
}

object coronavirusDePersonaje{
    const property position = game.at(14,9)
    var property contagiado = false //
    
    method estaEnCondicionesDeContagio(){
    	return personaje.salio() && statsDelJuego.higieneDePersonaje().cantidad() <= 20 && statsDelJuego.humorDePersonaje().cantidad() <= 20 
    }
	method probabilidadDeContagio(){
		const proporcionStatsDeContagio = (statsDelJuego.higieneDePersonaje().cantidad() + statsDelJuego.humorDePersonaje().cantidad() ).div(10)
		return (1.randomUpTo(proporcionStatsDeContagio))
	}
	method analizarContagio(){
		if((self.probabilidadDeContagio()).between(0,3)){
			contagiado=true
			game.removeVisual(living.salida())
			game.removeTickEvent("puede contagiarse")
			self.cuarentena()
			}
		}
		
	method cuarentena(){		
		game.onTick(2000, "cuarentena", {contagiado = false game.addVisual(living.salida()) game.removeTickEvent("cuarentena")})	 
	}
    method visual(){
        if(self.contagiado()) // si usamos if(self.contagiado) rompe todo 
            return "corona.png"
        return "feliz.jpg"
}
    method image() = self.visual()
}
