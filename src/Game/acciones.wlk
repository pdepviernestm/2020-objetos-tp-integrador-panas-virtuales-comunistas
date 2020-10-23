import stats.*
import productos.*
import objetos.*

object personaje {
	var property salio = false
	method dormir(){
		statsDelJuego.energiaDePersonaje().modificarCantidad(50)
		statsDelJuego.saludDePersonaje().modificarCantidad(20) //hay que ver si esta accion modifica o no la salud ya que por el momento 
														  //la salud depende estrictamente de la higiene
		statsDelJuego.humorDePersonaje().modificarCantidad(20)
	}
	method lavarseLasManos(){
		statsDelJuego.higieneDePersonaje().modificarCantidad(20)
	}
	method defecar()                    // Hace el 2
	{
		statsDelJuego.higieneDePersonaje().modificarCantidad(-20)
		statsDelJuego.saludDePersonaje().modificarCantidad(20)
		statsDelJuego.saciedadDePersonaje().modificarCantidad(-10)
	}
	method trabajar(humorqconsume, sueldo, energiaqconsume){                 // trabaja desde la compu
      statsDelJuego.humorDePersonaje().modificarCantidad(humorqconsume)
      statsDelJuego.modificarPlata(sueldo)
      statsDelJuego.energiaDePersonaje().modificarCantidad(energiaqconsume)
	}
	method comprarComida(){            //compra comida por la compu
      statsDelJuego.modificarPlata(-100)
      statsDelJuego.energiaDePersonaje().modificarCantidad(-5)
      statsDelJuego.humorDePersonaje().modificarCantidad(10)
      statsDelJuego.saciedadDePersonaje().modificarCantidad(100)
      statsDelJuego.higieneDePersonaje().modificarCantidad(-5)		
	}
	method salir(){                // sale a divertirce
      statsDelJuego.modificarPlata(-100)
      statsDelJuego.energiaDePersonaje().modificarCantidad(-20)
      //statsDelJuego.humorDePersonaje().modificarCantidad(50)
      salio = true
              
	}
	method trabajarFuera(){     // Va a laburar y gana mas lata q desde casa(da corona)
      statsDelJuego.modificarPlata(400)
      statsDelJuego.energiaDePersonaje().modificarCantidad(-40)
      statsDelJuego.humorDePersonaje().modificarCantidad(-40)
      salio = true
	}
	method comer(){
		const comida = mochila.encontrarComida()
		comida.comer()
		mochila.sacarComida(comida)				
	}

	method higieneBaja(){
		return (statsDelJuego.higieneDePersonaje().cantidad() < 50)
	}
	method efectoCorona(){
		statsDelJuego.saludDePersonaje().modificarCantidad(-10)
		statsDelJuego.saciedadDePersonaje().modificarCantidad(-20)
		statsDelJuego.energiaDePersonaje().modificarCantidad(-30)
	}
	method morir(){ // Booleano para matar al personaje
		return statsDelJuego.saludDePersonaje().cantidad() <= 0 || statsDelJuego.saciedadDePersonaje().cantidad() <= 0 || statsDelJuego.humorDePersonaje().cantidad() <= 0
	}
}
