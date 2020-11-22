import wollok.game.*
import personajesVisuales.*
import stats.*
import objetos.*

class ProductoBase inherits ObjetoVisualBasico{
	var property nombre 
	var property precio
	
	method precioDelProducto(){
		return precio
	}
	method tieneMismoNombre(nombreDeProducto)=	nombre == nombreDeProducto
}

class Producto inherits ProductoBase{
	var property valorEnergia
	var property valorHumor
	var property valorSaciedad	
	var property valorHigiene
	var property valorSalud
		
	method producirEfecto() {
		personajePrincipal.cambiarStats(valorEnergia,valorHumor,valorSaciedad,valorHigiene,valorSalud)
	}
}
class CuraTotal inherits ProductoBase { 
	 
	method producirEfecto(){
		personajePrincipal.meCure()
		}
	
}
