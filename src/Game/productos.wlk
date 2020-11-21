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
	
	method producirEfecto() {
		personajePrincipal.cambiarStats(valorEnergia,valorHumor,valorSaciedad,valorHigiene,valorSalud)
	}
}
class CuraTotal inherits Producto {  //arreglar para q ande false
	 
	override method producirEfecto(){
		coronavirusDePersonaje.meCure()
			}
	
}


const pizza = new Producto(nombre = "Pizza", precio = 300, valorEnergia = -5, valorHumor = 10, valorSaciedad = 100, valorHigiene = -5, valorSalud = -5,imagen="Pizza.jpg")
const jojaCola = new Producto(nombre = "JojaCola", precio = 100, valorEnergia = 10, valorHumor = 10, valorSaciedad = 10, valorHigiene = -5, valorSalud = -5,imagen="lata.png")
const comidaBarata = new Producto(nombre = "ComidaBarata", precio = 100, valorEnergia = -5, valorHumor = -5, valorSaciedad = 50, valorHigiene = -5, valorSalud = -10,imagen="comidabaratata.png")
const fruta = new Producto(nombre = "Fruta", precio = 200, valorEnergia = 10, valorHumor = -5, valorSaciedad = 80, valorHigiene = -5, valorSalud = 10,imagen="frutita.png")
const carameloRaro = new Producto(nombre = "CarameloRaro", precio = 800, valorEnergia = 100, valorHumor = 100, valorSaciedad = 100, valorHigiene = 100, valorSalud = 100,imagen="CarameloRaro.png")
const alcoholEnGel = new Producto(nombre = "AlcoholEnGel", precio = 200, valorEnergia = 0, valorHumor = 0, valorSaciedad = 0, valorHigiene = 50, valorSalud = 0,imagen="buenaSalud.jpg")
const curaTotal = new CuraTotal(nombre = "CuraTotal", precio = 2000, valorEnergia = 0, valorHumor = 0, valorSaciedad = 0, valorHigiene = 0, valorSalud = 0,imagen="curaCorona.jpg")
