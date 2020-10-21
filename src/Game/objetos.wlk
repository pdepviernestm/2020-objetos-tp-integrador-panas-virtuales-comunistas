import wollok.game.*
import juanTamagochi.*
import mapas.*
import personajesVisuales.*
import productos.*
import stats.*


class ObjetoVisual{
	const property x
	const property y
	const property imagen
	const property esDeTransicion = false
	const property accionPrimaria ={parametro=>} //bloques que no hacen nada,hay que modificar en cada new ObjetoVisual(como por ej cama), es lo que define la accion de cada uno
	const property accionSecundaria={parametro=>}
	const property accionTerciaria={parametro=>}
	const property mapaNuevo = null
	const property posicionEnMapaNuevo = null
	var property position = game.origin()
	method image()=imagen
	method configurarVisual(){
		position=game.at(x,y)
		game.addVisual(self)
	}
	method borrarSuVisual(){
		game.removeVisual(self)
	}
	method activarAccion(posicionDelPersonaje){
		return posicionDelPersonaje == self.position() && game.hasVisual(self)
	}
	method activarAccionPrimaria(personaje){
		accionPrimaria.apply(personaje)
	}
	method activarAccionSecundaria(personaje){
		accionSecundaria.apply(personaje)
	}
	method activarAccionTerciaria(carro){
		accionTerciaria.apply(carro)
	}
	method transicion(){
		juanTamagochi.modificarMapa(mapaNuevo,posicionEnMapaNuevo)
	}
}
/* 
object accionesSalida{
	method primaria(protagonista){
		juanTamagochi.modificarMapa(mapas.superMercadoJoJo(),(game.origin())) // la salida solo hace la transicion al mapa general. Y recien desde el mapa general se va al super
	}
	method secundaria(protagonista){
		juanTamagochi.modificarMapa(mapas.mapa(),(game.origin()))
	}
}
*/
object living {
	const protagonista = juanTamagochi.protagonista()
	
	const property puertaEntradaBanio=new ObjetoVisual(x=7,y=11,imagen="puertaBaño.jpg",esDeTransicion=true,mapaNuevo=mapas.banioDeLaCasa(),posicionEnMapaNuevo=game.origin())
	const pc=new ObjetoVisual(x=13,y=11,imagen="PC.jpg",accionPrimaria={personaje => personaje.trabajar()} ,accionSecundaria={personaje => personaje.comprarComida()} )//
	const cama=new ObjetoVisual(x=7,y=7,imagen="cama.jpg",accionPrimaria={personaje => personaje.dormir()})
	const cocina=new ObjetoVisual(x=3,y=11,imagen="cocina.jpg")
	const salida=new ObjetoVisual(x=0,y=5,imagen="salidaLiving.jpg",esDeTransicion=true,mapaNuevo=mapas.superMercadoJoJo(),posicionEnMapaNuevo=game.origin())
	const heladera=new ObjetoVisual(x=5,y=11,imagen="heladera.png") // Cual sería la función de la heladera?
	
	const lista = [pc,cama,cocina,puertaEntradaBanio,salida,heladera] 
	//const lista=[pc,cama,cocina,puertaEntradaBanio,heladera]
	const property position = game.origin()
	method image() = "Piso.png"
	method configurarTeclas(){
		keyboard.s().onPressDo{lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto => if(!(objeto.esDeTransicion()) ) 
																																objeto.activarAccionPrimaria(protagonista)
																														  else{objeto.transicion()}
		})
		}
		keyboard.a().onPressDo{lista.filter({objeto=> objeto.activarAccion(protagonista.position())}).forEach({objeto=>objeto.activarAccionSecundaria(protagonista)})}
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
	const lavamanos = new ObjetoVisual(x=3,y=2,imagen="lavaManos.jpg",accionPrimaria={personaje=>personaje.lavarseLasManos()})
	const inodoro = new ObjetoVisual(x=9,y=2,imagen="inodoro.jpg",accionSecundaria={personaje=>personaje.defecar()})
	
	const protagonista = personajePrincipal
	const lista = [lavamanos,inodoro]
	const property position = game.origin()
	method image()="fondo-baño.jpg"
	method configurarTeclas(){
		keyboard.s().onPressDo{lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto => objeto.activarAccionPrimaria(protagonista)})
		}
 		keyboard.a().onPressDo{lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto => objeto.activarAccionSecundaria(protagonista)	
 										})
 							   if(protagonista.position()==self.position()&&game.hasVisual(self)){
 															juanTamagochi.modificarMapa(mapas.livingDeLaCasa(),(living.puertaEntradaBanio().position())
 																									)}	
 	 //Las teclas de cambio de mapa tienen que ser distintas porque sino no funciona la transición
	}
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

object superMercado {
	const jojoPizza = new ObjetoVisual(x=7,y=11,imagen="jojoPizza.png",accionTerciaria={carro => carro.agregarComida(new Pizza())})
	const jojaCola = new ObjetoVisual(x=2,y=7,imagen="jojaCola.png",accionTerciaria={carro => carro.agregarComida(new JojaCola())})
	const fruta = new ObjetoVisual(x=2,y=11,imagen="fruta.png",accionTerciaria={carro => carro.agregarComida(new Fruta())})
	const comidaBarata = new ObjetoVisual(x=7,y=7,imagen="comidaBarata.png",accionTerciaria={carro => carro.agregarComida(new ComidaBarata())})
	const basura = new ObjetoVisual(x=11,y=5,imagen="basura.png",accionTerciaria={carro => carro.vaciarCarrito()})	
	const cajera = new ObjetoVisual(x=1,y=3,imagen="Punto.png",accionTerciaria={carro => carro.decirHola()})
	const caja = new ObjetoVisual(x=4,y=3,imagen="Punto.png",accionTerciaria={carro => carro.calcularPrecio()})
//	const ahorretor = new ObjetoVisual(x=11,y=4,imagen="Punto.png")
	
	
	const protagonista = personajePrincipal
	const lista = [jojaCola,jojoPizza,fruta,comidaBarata,basura,caja,cajera]
	const property position = game.origin()
	method image()="superMercado.png"
	method configurarTeclas(){
		
 		keyboard.s().onPressDo{lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto => objeto.activarAccionTerciaria(carrito)})
 		}
 		keyboard.a().onPressDo({
 								if(protagonista.position()==self.position()&&game.hasVisual(self)){
 																juanTamagochi.modificarMapa(mapas.livingDeLaCasa(),(mapas.livingDeLaCasa().mapaActual().position())
 																									)}		
 										}) //Las teclas de cambio de mapa tienen que ser distintas porque sino no funciona la transición
	}
// viejomodo de hacerlo         if(protagonista.position() == jojoPizza.position()&&game.hasVisual(jojoPizza)){carrito.add(new Pizza())}		
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

object carrito {
	var property comidas = []
	
	method decirHola(){
		game.say(self,"Holaaa")
	}
	
	method agregarComida(comida){
		comidas.add(comida)
		game.say(self,"Llene el carrito :)")
	}
	method vaciarCarrito(){
		comidas = []
		game.say(self,"Vacie el carrito ;/")
	}
	method calcularPrecio(){
		const precio = comidas.sum({unProducto => unProducto.valor()})
		if(precio <= stats.cantidadPlata() && comidas.size() > 0 ) {
			stats.modificarPlata(-precio)
			comidas.forEach({producto => mochila.agregarComida(producto)})                     
            comidas = []
            game.say(self,"Me gaste la plata ;/")
		}		
	}
	method encontrarComida(){
		return comidas.find({comida => comida.valor() > 50 })
	}
	
}

object mochila {
	var property comidas = [new Pizza()]
	
	method agregarComida(comida){
		comidas.add(comida)
	}
	method sacarComida(comida){
		comidas.remove(comida)
	}
	method encontrarComida(){
		return comidas.find({comida => comida.valor() > 50 })
	}
	method comer(comida){
		
		comida.comer()
	}
}

object mapaGeneral{
	
	const protagonista = personajePrincipal
	const lista = []
	const property position = game.origin()
//	const salida=new ObjetoVisual(x=0,y=5,imagen="salidaMapaGeneral.jpg") // esto no se esta usando
	method image() = "mapaGeneral.png"
	method configurarTeclas(){
		
		            keyboard.s().onPressDo({})
			
					keyboard.a().onPressDo({
								if(protagonista.position()==self.position()&&game.hasVisual(self)){
 																juanTamagochi.modificarMapa(mapas.livingDeLaCasa(),(mapas.livingDeLaCasa().mapaActual().position()))}
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
