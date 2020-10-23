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
	method transicion(mapa){
		juanTamagochi.modificarMapa(mapa,posicionEnMapaNuevo)
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
	const cocina=new ObjetoVisual(x=3,y=11,imagen="cocina.jpg",accionPrimaria={personaje => personaje.comer()})
	const property salida=new ObjetoVisual(x=0,y=5,imagen="salidaLiving.jpg",esDeTransicion=true,mapaNuevo=mapas.superMercadoJoJo(),posicionEnMapaNuevo=game.origin())
	const heladera=new ObjetoVisual(x=5,y=11,imagen="heladera.png") // Cual sería la función de la heladera?
	
	const lista = [pc,cama,cocina,puertaEntradaBanio,salida,heladera] 
	//const lista=[pc,cama,cocina,puertaEntradaBanio,heladera]
	const property position = game.origin()
	method image() = "Piso.png"
	method configurarTeclas(){
		keyboard.s().onPressDo{lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto => if(!(objeto.esDeTransicion()) ) 
																																objeto.activarAccionPrimaria(protagonista)
																														  else{objeto.transicion(mapas.superMercadoJoJo())}
		})
		}
		keyboard.a().onPressDo{lista.filter({objeto=> objeto.activarAccion(protagonista.position())}).forEach({objeto => if(!(objeto.esDeTransicion()) ) 
																																objeto.activarAccionPrimaria(protagonista)
																														  else{objeto.transicion(mapas.oficina())}
		}
		)
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
	const jojoPizza = new ObjetoVisual(x=7,y=11,imagen="jojoPizza.png",accionPrimaria={carro => carro.agregarComida(new Pizza())},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Pizza")})
	const jojaCola = new ObjetoVisual(x=2,y=7,imagen="jojaCola.png",accionPrimaria={carro => carro.agregarComida(new JojaCola())},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"JojaCola")})
	const fruta = new ObjetoVisual(x=2,y=11,imagen="fruta.png",accionPrimaria={carro => carro.agregarComida(new Fruta())},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Fruta")})
	const comidaBarata = new ObjetoVisual(x=7,y=7,imagen="comidaBarata.png",accionPrimaria={carro => carro.agregarComida(new ComidaBarata())},accionSecundaria={personaje => personaje.cantidadDe(carrito.comidas(),"Comida barata")})
	const basura = new ObjetoVisual(x=11,y=5,imagen="basura.png",accionPrimaria={carro => carro.vaciarCarrito()})	
	const property cajera = new ObjetoVisual(x=1,y=3,imagen="Punto.png",accionPrimaria={carro=>carro.informarMontoYCantidad()})
	const caja = new ObjetoVisual(x=4,y=3,imagen="Punto.png",accionPrimaria={carro => carro.cobrar()})
	const ahorrador = new ObjetoVisual(x=11,y=10,imagen="ahorradorT.png",accionPrimaria={carro => carro.seleccionarBarato()})
	
	
	const property protagonista = personajePrincipal
	const lista = [jojaCola,jojoPizza,fruta,comidaBarata,basura,caja,cajera,ahorrador]
	const property position = game.origin()
	method image()="superMercado.png"
	method configurarTeclas(){
		
 		keyboard.s().onPressDo{lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto => objeto.activarAccionPrimaria(carrito)})
 		}
 		keyboard.a().onPressDo({lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto => objeto.activarAccionSecundaria(protagonista)})
 								if(protagonista.position()==self.position()&&game.hasVisual(self)){
 																juanTamagochi.modificarMapa(mapas.livingDeLaCasa(),(mapas.livingDeLaCasa().mapaActual().position())
 																									)protagonista.salir()}		
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
	const property position= game.at(7,7)
	const property protagonista = personajePrincipal
	method image()="feliz.jpg"
	method agregarVisual(){
		game.addVisual(self)
	}
	
	method agregarComida(comida){
		comidas.add(comida)
		const nombreComida = comida.nombre()
		game.say(protagonista,"agregué une " + nombreComida +" al carrito")
	}
	method vaciarCarrito(){
		if(comidas == [])
			game.say(protagonista,"No tengo nada para tirar")
		else {
			comidas = []
			game.say(protagonista,"Vacie el carrito :/")
			}
	}
	method calcularPrecio(){
		return (comidas.map({unProducto => unProducto.valor()})).sum()	
	}
	method cantidadDe(nombreProducto){
		return (comidas.filter({unProducto=>unProducto.nombre() == nombreProducto})).size()
	}
	method informarMontoYCantidad(){
		const precio = self.calcularPrecio()
		const cantidadDePizzas=self.cantidadDe("Pizza")
		const cantidadDeJojaCola= self.cantidadDe("JojaCola")
		const cantidadDeComidaBarata=self.cantidadDe("Comida barata")
		const cantidadDeFruta = self.cantidadDe("Fruta")
			game.say(superMercado.cajera(),"los productos son: "+cantidadDePizzas+" Pizzas, "+cantidadDeJojaCola+" JojaColas, "+cantidadDeComidaBarata+" comidas baratas, y "
											+cantidadDeFruta+" Frutas")
			game.say(superMercado.cajera(),"el precio es "+ precio.toString())
	}
	method cobrar(){
		const precio = self.calcularPrecio()
		if(precio <= statsDelJuego.cantidadPlata() && comidas.size() > 0 ) {
			statsDelJuego.modificarPlata(-precio)
			comidas.forEach({producto => mochila.agregarComida(producto)})                     
            comidas = []
            protagonista.plataActual()
		}
	}
	method seleccionarBarato(){
		comidas.filter({comida => comida.valor() > 200}).forEach({comida => comidas.remove(comida)})
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
object oficina{
	const protagonista = juanTamagochi.protagonista()
	const pc = new ObjetoVisual(x=2,y=7,imagen="punto.png",accionPrimaria={protagonista=>protagonista.trabajar()})
	const salida = new ObjetoVisual(x=8,y=0,imagen="punto.png",mapaNuevo=mapas.livingDeLaCasa(),posicionEnMapaNuevo=game.origin(),esDeTransicion=true)
	const lista=[pc,salida]
	const property position = game.origin()
	method image() = "oficina.png"
	method configurarTeclas(){
		keyboard.s().onPressDo{lista.filter({objeto => objeto.activarAccion(protagonista.position())}).forEach({objeto => if(!(objeto.esDeTransicion()) ) 
																																objeto.activarAccionPrimaria(protagonista)
																														  else{objeto.transicion(mapas.livingDeLaCasa())}
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