import wollok.game.*
import juanTamagochi.*
import mapas.*
import personajesVisuales.*
import productos.*
import stats.*
import objetos.*

object personaje {
	var property salio = false
	
	method cambiarStats(valorEnergia,valorHumor,valorSaciedad,valorHigiene,valorSalud){
		statsDelJuego.energiaDePersonaje().modificarCantidad(valorEnergia)
        statsDelJuego.humorDePersonaje().modificarCantidad(valorHumor)
        statsDelJuego.saciedadDePersonaje().modificarCantidad(valorSaciedad)
        statsDelJuego.higieneDePersonaje().modificarCantidad(valorHigiene)	
	    statsDelJuego.saludDePersonaje().modificarCantidad(valorSalud)
	}
	method comer(){                                //Agarra de la mochila y usa el objeto
		const producto = mochila.encontrarProducto()
		producto.producirEfecto()
		mochila.sacarProducto(producto)				
	}
	method delivery(){            //compra comida por la compu
      statsDelJuego.modificarPlata(-100)
      statsDelJuego.energiaDePersonaje().modificarCantidad(-5)
      statsDelJuego.humorDePersonaje().modificarCantidad(10)
      statsDelJuego.saciedadDePersonaje().modificarCantidad(100)
      statsDelJuego.higieneDePersonaje().modificarCantidad(-5)		
	}
	method gastarPlata(cantidadDePlata){
		statsDelJuego.gastarPlata(cantidadDePlata)
	}
	method defecar(){                    // Hace el 2
		statsDelJuego.higieneDePersonaje().modificarCantidad(-20)
		statsDelJuego.saludDePersonaje().modificarCantidad(20)
		statsDelJuego.saciedadDePersonaje().modificarCantidad(-10)
	}
	
	method dormir(){
		statsDelJuego.energiaDePersonaje().modificarCantidad(50)
		statsDelJuego.saludDePersonaje().modificarCantidad(20) 
		statsDelJuego.humorDePersonaje().modificarCantidad(20)
		statsDelJuego.saciedadDePersonaje().modificarCantidad(-20)
		statsDelJuego.agregarUnDia()
	}
	
	method efectoCorona(){                                          //El efecto q causa tener corona
		statsDelJuego.saludDePersonaje().modificarCantidad(-10)
		statsDelJuego.saciedadDePersonaje().modificarCantidad(-20)
		statsDelJuego.energiaDePersonaje().modificarCantidad(-30)
	}
	method higieneBaja(){
		return (statsDelJuego.higieneDePersonaje().cantidad() < 50)
	}
	
	method lavarseLasManos(){
		statsDelJuego.higieneDePersonaje().modificarCantidad(20)
	}

	method trabajar(humorqconsume, sueldo, energiaqconsume){                 // trabaja desde la compu
      statsDelJuego.humorDePersonaje().modificarCantidad(humorqconsume)
      statsDelJuego.modificarPlata(sueldo)
      statsDelJuego.energiaDePersonaje().modificarCantidad(energiaqconsume)
	}

	method salir(){                // sale a divertirse
      salio = true             
	}
	
	method morir(){ // Booleano para matar al personaje
		return statsDelJuego.saludDePersonaje().cantidad() <= 0 || statsDelJuego.saciedadDePersonaje().cantidad() <= 0 || statsDelJuego.humorDePersonaje().cantidad() <= 0
	}
}
