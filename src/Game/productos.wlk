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
	
	method producirEfecto() {/*Deberia haber una forma de solucionar esto, porque si tuvieramos que agregar un estado más sería
	 							mucho bardo tener que definirlo, agregar un nuevo atributo para productos, sumarle a cada producto
	 							la cantidad de afeccion para ese stat, agregarlo en el method cambiarStats tanto para el archivo
	 							de personajesVisuales como para el de acciones, por el momento no tengo idea de cómo solucionarlo*/
		personajePrincipal.cambiarStats(valorEnergia,valorHumor,valorSaciedad,valorHigiene,valorSalud)
	}
	method tieneMismoNombre(nombreDeProducto)=	nombre == nombreDeProducto
}
class CuraTotal inherits Producto { 
	 
	override method producirEfecto(){
		personajePrincipal.meCure()
			}
	
}
