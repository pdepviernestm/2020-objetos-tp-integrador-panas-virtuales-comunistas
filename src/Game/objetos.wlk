import wollok.game.*
import juanTamagochi.*
import mapas.*
import personajesVisuales.*

class ObjetoVisual{
	const property x
	const property y
	//const property acciones
	const property imagen
	var property position = game.origin()
	method image()=imagen
	method configurarVisual(){
		position=game.at(x,y)
		game.addVisual(self)
	}
	method borrarSuVisual(){
		game.removeVisual(self)
	}
}

object accionesCama{
	method primaria(protagonista){
		protagonista.dormir() 
	}
	method secundaria(protagonista){
	}
}
object living {
	const property puertaEntradaBanio=new ObjetoVisual(x=7,y=11,imagen="puertaBaño.jpg")
	const pc=new ObjetoVisual(x=13,y=11,imagen="PC.jpg")
	const cama=new ObjetoVisual(x=7,y=7,imagen="cama.jpg")
	const cocina=new ObjetoVisual(x=3,y=11,imagen="cocina.jpg")
	const salida=new ObjetoVisual(x=0,y=5,imagen="feliz.jpg")
	
	const protagonista = personajePrincipal
	const lista = [pc,cama,cocina,puertaEntradaBanio,salida]

	const property position = game.origin()
	method image() = "Piso.png"
	method configurarTeclas(){
		keyboard.s().onPressDo({if(protagonista.position() == cama.position()&& game.hasVisual(cama)){protagonista.dormir()}})
		keyboard.s().onPressDo({if(protagonista.position() == pc.position()&&game.hasVisual(pc)){protagonista.trabajar()}})
		keyboard.a().onPressDo({if(protagonista.position() == pc.position()&&game.hasVisual(pc)){protagonista.comprarComida()}})
		keyboard.s().onPressDo({if(protagonista.position()== cocina.position()&&game.hasVisual(cocina)){protagonista.comer()}})
		keyboard.s().onPressDo({if(protagonista.position() == salida.position()&&game.hasVisual(salida)){protagonista.salir()}})
		keyboard.a().onPressDo({if(protagonista.position() == salida.position()&&game.hasVisual(salida)){protagonista.trabajarFuera()}})
		keyboard.s().onPressDo({if(protagonista.position() == puertaEntradaBanio.position()&&game.hasVisual(puertaEntradaBanio)){
																	juanTamagochi.modificarMapa(mapas.banioDeLaCasa(),(game.origin()))
		}})}
	method configurarVisual(){
		game.addVisual(self)
		self.configurarObjetos()
	}
		method configurarObjetos(){
		lista.forEach{objeto => objeto.configurarVisual()}
	}
		method borrarse(){
			lista.forEach{objeto => objeto.borrarSuVisual()}
			game.removeVisual(self)
		}
}
object banio {
	const lavamanos = new ObjetoVisual(x=3,y=2,imagen="lavaManos.jpg")
	const inodoro = new ObjetoVisual(x=9,y=2,imagen="inodoro.jpg")
	const living = mapas.livingDeLaCasa()
	
	const protagonista = personajePrincipal
	const lista = [lavamanos,inodoro]
	const property position = game.origin()
	method image()="fondo-baño.jpg"
	method configurarTeclas(){
 		keyboard.s().onPressDo({if(protagonista.position() == lavamanos.position()&&game.hasVisual(lavamanos))protagonista.lavarseLasManos()})
 		keyboard.d().onPressDo({if(protagonista.position() == inodoro.position()&&game.hasVisual(inodoro)) protagonista.defecar()})
 		keyboard.space().onPressDo({if(protagonista.position()==self.position()&&game.hasVisual(self)){ 
 											juanTamagochi.modificarMapa(living,(living.mapaActual().puertaEntradaBanio().position()
 											))}
 		})
	}
	method configurarVisual(){
		game.addVisual(self)
		self.configurarObjetos()
	}
		method configurarObjetos(){
		lista.forEach{objeto => objeto.configurarVisual()}
	}
	method borrarse(){
			lista.forEach{objeto => objeto.borrarSuVisual()}
			game.removeVisual(self)
		}
}

