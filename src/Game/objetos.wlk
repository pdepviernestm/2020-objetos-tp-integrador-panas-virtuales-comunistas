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
/*class Acciones{
	const property accionPrim
	const property accionSec
	method primaria(){
		return accionPrim
	}
	method secundaria(){
		return accionSec
	}
}*/
object accionesCama{
	method primaria(protagonista){
		protagonista.dormir() 
	}
	method secundaria(protagonista){
	}
}
object accionesPC{
	method primaria(protagonista){
		protagonista.trabajar()
	}
	method secundaria(protagonista){
		protagonista.comprarComida()
	}
}
object accionesCocina{
	method primaria(protagonista){
		protagonista.comer()
	}
	method secundiara(protagonista){
	}
}
object accionesSalida{
	method primaria(protagonista){
		protagonista.salir()
	}
	method secundaria(protagonista){
		protagonista.trabajarFuera()
	}
}
object accionesPuertaEntradaBanio{
	method primaria(protagonista){
		juanTamagochi.modificarMapa(mapas.banioDeLaCasa(),(game.origin()))
	}
	method segundaria(protagonista){
	}
}
object accionesLavamanos{
	method primaria(protagonista){
		protagonista.lavarseLasManos()
	}
	method secundaria(){
	}
}
object accionesInodoro{
	method primaria(protagonista){
		protagonista.defecar()
	}
	method secundaria(protagonista){
	}
}
object living {
	const protagonista = juanTamagochi.protagonista()
	
	const property puertaEntradaBanio=new ObjetoVisual(x=7,y=11,imagen="puertaBaño.jpg")
	const pc=new ObjetoVisual(x=13,y=11,imagen="PC.jpg")
	const cama=new ObjetoVisual(x=7,y=7,imagen="cama.jpg")
	const cocina=new ObjetoVisual(x=3,y=11,imagen="cocina.jpg")
	const salida=new ObjetoVisual(x=0,y=5,imagen="salidaLiving.jpg")
	
	const lista = [pc,cama,cocina,puertaEntradaBanio,salida]

	const property position = game.origin()
	method image() = "Piso.png"
	method configurarTeclas(){
		keyboard.s().onPressDo({if(protagonista.position() == cama.position()&& game.hasVisual(cama)){accionesCama.primaria(protagonista)}
								if(protagonista.position() == pc.position()&&game.hasVisual(pc)){protagonista.trabajar()}
								if(protagonista.position()== cocina.position()&&game.hasVisual(cocina)){protagonista.comer()}
								if(protagonista.position() == salida.position()&&game.hasVisual(salida)){protagonista.salir()}
								if(protagonista.position() == puertaEntradaBanio.position()&&game.hasVisual(puertaEntradaBanio)){
																	juanTamagochi.modificarMapa(mapas.banioDeLaCasa(),(game.origin()))}
		})
		keyboard.a().onPressDo({if(protagonista.position() == pc.position()&&game.hasVisual(pc)){protagonista.comprarComida()}
								if(protagonista.position() == salida.position()&&game.hasVisual(salida)){protagonista.trabajarFuera()}
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
object banio {
	const lavamanos = new ObjetoVisual(x=3,y=2,imagen="lavaManos.jpg")
	const inodoro = new ObjetoVisual(x=9,y=2,imagen="inodoro.jpg")
	
	const protagonista = personajePrincipal
	const lista = [lavamanos,inodoro]
	const property position = game.origin()
	method image()="fondo-baño.jpg"
	method configurarTeclas(){
		
 		keyboard.s().onPressDo({if(protagonista.position() == lavamanos.position()&&game.hasVisual(lavamanos)){accionesLavamanos.primaria(protagonista)}
 								})
 		keyboard.a().onPressDo({if(protagonista.position() == inodoro.position()&&game.hasVisual(inodoro)) {accionesInodoro.primaria(protagonista)}
 								if(protagonista.position()==self.position()&&game.hasVisual(self)){
 																juanTamagochi.modificarMapa(mapas.livingDeLaCasa(),(mapas.livingDeLaCasa().mapaActual().puertaEntradaBanio().position())
 																									)}		
 										}) //Las teclas de cambio de mapa tienen que ser distintas porque sino no funciona la transición
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

