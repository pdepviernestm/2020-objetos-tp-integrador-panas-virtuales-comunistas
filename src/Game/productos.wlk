import wollok.game.*
import personajesVisuales.*
import stats.*
import objetos.*

class Producto inherits ObjetoVisualBasico{      //modificar para que ande mochila
	var property nombre 
	var property precio 
	var property valorEnergia
	var property valorHumor
	var property valorSaciedad	
	var property valorHigiene
	var property valorSalud
	
	method precioDelProducto(){
		return precio
	}
	
	method producirEfecto() {/*Vamos a tener que romper todo para que el personaje tenga sus stats adentro y asi no romper el 
								encapsulamiento*/
		personajePrincipal.cambiarStats(valorEnergia,valorHumor,valorSaciedad,valorHigiene,valorSalud)
	}
	method tieneMismoNombre(nombreDeProducto)=	nombre == nombreDeProducto
}
class CuraTotal inherits Producto { 
	 
	override method producirEfecto(){
		personajePrincipal.meCure()
			}
	
}
