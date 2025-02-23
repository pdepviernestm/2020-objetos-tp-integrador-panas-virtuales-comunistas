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
			cantidad += cantidadQueModifica
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

class StatConLimite inherits Stat{
	var property limiteStats = 100
	var property minimoDeStats = 0
	
	override method modificarCantidad(cantidadQueModifica){cantidad = (cantidad +cantidadQueModifica).min(limiteStats).max(minimoDeStats)}
}
object statsDelJuego {
	var property cantidadPlata = 10000
	var property dias = 0
	
	
	const property saludDePersonaje = new StatConLimite (cantidad = 100,x=14,y=12,buenaImagen="corazonLleno.png",mediaImagen="corazonMitad.png",malaImagen="corazonVacio.png")
	const property energiaDePersonaje = new StatConLimite (cantidad=100,x=14,y=11,buenaImagen="energiaLlena.jpg",mediaImagen="energiaMitad.jpg",malaImagen="energiaVacia.png")
	const property humorDePersonaje = new StatConLimite (cantidad = 100,x=14,y=14,buenaImagen="feliz.jpg",mediaImagen="neutral.jpg",malaImagen="triste.jpg")
	const property higieneDePersonaje = new StatConLimite (cantidad=100,x=14,y=13,buenaImagen="buenasalud.jpg",mediaImagen="pocaSalud.jpg",malaImagen="malaSalud.jpg")
	const property saciedadDePersonaje = new StatConLimite (cantidad=100,x=14,y=10,buenaImagen="Pizza.jpg",mediaImagen="PizzaCortada.jpg",malaImagen="PizzaPorcion.jpg")
	const property listaDeStats = [saludDePersonaje,energiaDePersonaje,humorDePersonaje,higieneDePersonaje,saciedadDePersonaje,coronavirusDePersonaje]
	method configurarAfeccionesDeStats(){
		game.onTick(20000,"disminuye humor cada 20 seg",{self.humorDePersonaje().modificarCantidad(-5)}) //-5
		game.onTick(20000,"disminuye la energia cada 20 seg",{self.energiaDePersonaje().modificarCantidad(-5)}) //-5
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
	method gastarPlata(cantidadDePlata){
		self.modificarPlata(cantidadDePlata)
	}
	method agregarUnDia(){
		dias += 1
	}
	
}

object coronavirusDePersonaje{
    const property position = game.at(14,9)
    var property contagiado = false //
    
    method estaEnCondicionesDeContagio(){
    	return personaje.salio() && statsDelJuego.higieneDePersonaje().cantidad() <= 50 && statsDelJuego.humorDePersonaje().cantidad() <= 50 
    }
	method probabilidadDeContagio(){
		const proporcionStatsDeContagio = (statsDelJuego.higieneDePersonaje().cantidad() + statsDelJuego.humorDePersonaje().cantidad() ).div(10)
		return (1.randomUpTo(proporcionStatsDeContagio))
	}

	 
	method analizarContagio(){
		if((self.probabilidadDeContagio()).between(0,3)){
			self.meContagie()
			}
		}
	method meContagie(){
		contagiado=true
		game.onTick(30000,"efecto corona",{personaje.efectoCorona()})
		self.cuarentena()
		//removedorDeEvento.sacarTick("puede contagiarse")
	}
		
	method cuarentena(){		
		game.onTick(200000, "cuarentena", {contagiado = false removedorDeEvento.sacarTick("efecto corona") removedorDeEvento.sacarTick("cuarentena")}) 
	}
	method meCure(){
		contagiado = false 
		//removedorDeEvento.sacarTick("efecto corona")
	}
    method visual(){
        if(self.contagiado()) // si usamos if(self.contagiado) rompe todo 
            return "corona.png"
        return "cruz_verde.png"
    }
    method image() = self.visual()
}