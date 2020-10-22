import wollok.game.*
import stats.*

class Pizza {
	const property nombre ="Pizza"
	const property valor = 300
	method comer() {
    statsDelJuego.energiaDePersonaje().modificarCantidad(-5)
    statsDelJuego.humorDePersonaje().modificarCantidad(10)
    statsDelJuego.saciedadDePersonaje().modificarCantidad(100)
    statsDelJuego.higieneDePersonaje().modificarCantidad(-5)	
	statsDelJuego.saludDePersonaje().modificarCantidad(-5)
	}
}

class JojaCola {
	const property valor = 100
	const property nombre = "JojaCola"
	method comer() {
	statsDelJuego.energiaDePersonaje().modificarCantidad(10)
    statsDelJuego.humorDePersonaje().modificarCantidad(10)
    statsDelJuego.saciedadDePersonaje().modificarCantidad(10)
    statsDelJuego.higieneDePersonaje().modificarCantidad(-5)
    statsDelJuego.saludDePersonaje().modificarCantidad(-5)
    }		
}

class ComidaBarata {
	const property valor = 100
	const property nombre = "Comida barata"
	method comer() {
	statsDelJuego.energiaDePersonaje().modificarCantidad(-5)
    statsDelJuego.humorDePersonaje().modificarCantidad(-5)
    statsDelJuego.saciedadDePersonaje().modificarCantidad(50)
    statsDelJuego.higieneDePersonaje().modificarCantidad(-5)	
	statsDelJuego.saludDePersonaje().modificarCantidad(-10)
}
}

class Fruta {
	const property valor = 200
	const property nombre = "Fruta"
	method comer() {
	statsDelJuego.energiaDePersonaje().modificarCantidad(-5)
    statsDelJuego.humorDePersonaje().modificarCantidad(-5)
    statsDelJuego.saciedadDePersonaje().modificarCantidad(50)
    statsDelJuego.higieneDePersonaje().modificarCantidad(-5)	
	statsDelJuego.saludDePersonaje().modificarCantidad(10)
	}
}