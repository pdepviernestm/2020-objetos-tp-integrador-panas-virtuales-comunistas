import stats.*
import wollok.game.*

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
	method trabajar(){                 // trabaja desde la compu
      statsDelJuego.humorDePersonaje().modificarCantidad(-20)
      stats.modificarPlata(100)
      statsDelJuego.energiaDePersonaje().modificarCantidad(-20)
	}
	method comprarComida(){            //compra comida por la compu
      stats.modificarPlata(-100)
      statsDelJuego.energiaDePersonaje().modificarCantidad(-5)
      statsDelJuego.humorDePersonaje().modificarCantidad(10)
      statsDelJuego.saciedadDePersonaje().modificarCantidad(100)
      statsDelJuego.higieneDePersonaje().modificarCantidad(-5)		
	}
	method salir(){                // sale a divertirce
      stats.modificarPlata(-100)
      statsDelJuego.energiaDePersonaje().modificarCantidad(-20)
      statsDelJuego.humorDePersonaje().modificarCantidad(50)
      salio = true
              
	}
	method trabajarFuera(){     // Va a laburar y gana mas lata q desde casa(da corona)
      stats.modificarPlata(400)
      statsDelJuego.energiaDePersonaje().modificarCantidad(-40)
      statsDelJuego.humorDePersonaje().modificarCantidad(-40)
      salio = true
	}
	method tengoCorona() {             //Me da Corona q resta salud sobre tiempo
		if(statsDelJuego.higieneDePersonaje().cantidad() < 50)
		  game.onTick(20000, "modifica salud cada 20 segundos", {statsDelJuego.saludDePersonaje().modificarCantidad(-10)})
	}
	method comer(){
		statsDelJuego.energiaDePersonaje().modificarCantidad(10)
		statsDelJuego.humorDePersonaje().modificarCantidad(10)
		statsDelJuego.saciedadDePersonaje().modificarCantidad(50)
	}

}
