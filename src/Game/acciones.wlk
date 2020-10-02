import stats.*
import wollok.game.*

object personaje {
	var property salio = false
	
	method dormir(){
		stats.modificarEnergia(50)
		stats.modificarSalud(20) //hay que ver si esta accion modifica o no la salud ya que por el momento 
														  //la salud depende estrictamente de la higiene
		stats.modificarHumor(20)
	}
	method lavarseLasManos(){
		stats.modificarHigiene(20)
	}
	method defecar()                    // Hace el 2
	{
		stats.modificarHigiene(-20)
		stats.modificarSalud(20)
		stats.modificarHambre(-10)
	}
	method trabajar(){                 // trabaja desde la compu
      stats.modificarHumor(-20)
      stats.modificarPlata(100)
      stats.modificarEnergia(-20)
	}
	method comprarComida(){            //compra comida por la compu
      stats.modificarPlata(-100)
      stats.modificarEnergia(-5)
      stats.modificarHumor(10)
      stats.modificarHambre(100)
      stats.modificarHigiene(-5)		
	}
	method salir(){                // sale a divertirce
      stats.modificarPlata(-100)
      stats.modificarEnergia(-20)
      stats.modificarHumor(50)
      salio = true
              
	}
	method trabajarFuera(){     // Va a laburar y gana mas lata q desde casa(da corona)
      stats.modificarPlata(400)
      stats.modificarEnergia(-40)
      stats.modificarHumor(-40)
      salio = true
	}
	
	method tengoCorona() {             //Me da Corona q resta salud sobre tiempo
		if(stats.cantidadHigiene() < 50)
		  game.onTick(20000, "modifica salud cada 20 segundos", {stats.modificarSalud(-10)})
		  
	}

}
