import stats.*

object personaje {
	method dormir(){
		stats.modificarEnergia(50)
		//stats.modificarSalud() hay que ver si esta accion modifica o no la salud ya que por el momento 
														  //la salud depende estrictamente de la higiene
		stats.modificarHumor(20)
	}
	method lavarseLasManos(){
		stats.modificarHigiene(20)
	}
	method defecar()
	{
		stats.modificarHigiene(-20)
		//stats.modificarSalud(10) idem que dormir() 
	}
	method trabajar(){
      stats.modificarHumor(-20)
	}
	method salir(){

	}
	method trabajarFuera(){

	}

}
