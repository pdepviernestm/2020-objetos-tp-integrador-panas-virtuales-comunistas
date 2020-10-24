import wollok.game.*
import stats.*

class Producto {
	var property nombre 
	var property precio 
	var property valorEnergia
	var property valorHumor
	var property valorSaciedad	
	var property valorHigiene
	var property valorSalud
	
	method comer() {
    statsDelJuego.energiaDePersonaje().modificarCantidad(valorEnergia)
    statsDelJuego.humorDePersonaje().modificarCantidad(valorHumor)
    statsDelJuego.saciedadDePersonaje().modificarCantidad(valorSaciedad)
    statsDelJuego.higieneDePersonaje().modificarCantidad(valorHigiene)	
	statsDelJuego.saludDePersonaje().modificarCantidad(valorSalud)
	}
}

object productos{
	const property pizza = new Producto(nombre = "Pizza", precio = 300, valorEnergia = -5, valorHumor = 10, valorSaciedad = 100, valorHigiene = -5, valorSalud = -5)
	const property jojaCola = new Producto(nombre = "JojaCola", precio = 100, valorEnergia = 10, valorHumor = 10, valorSaciedad = 10, valorHigiene = -5, valorSalud = -5)
	const property comidaBarata = new Producto(nombre = "ComidaBarata", precio = 100, valorEnergia = -5, valorHumor = -5, valorSaciedad = 50, valorHigiene = -5, valorSalud = -10)
	const property fruta = new Producto(nombre = "Fruta", precio = 200, valorEnergia = 10, valorHumor = -5, valorSaciedad = 80, valorHigiene = -5, valorSalud = 10)
}