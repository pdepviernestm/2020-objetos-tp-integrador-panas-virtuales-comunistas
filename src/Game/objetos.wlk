import wollok.game.*
import Banio.*

object living {
	var property lista = [pc,cama,cocina,puertaEntradaBanio]
	const property position = game.origin()
	method image()="Piso.png"
}
object banio {
	var property lista = [lavamanos,inodoro]
	const property position = game.origin()
	method image()="fondo-baño.jpg"
}
object puertaEntradaBanio {
	const property position = game.at(7,11)
	method image()= "puertaBaño.jpg"
}

object pc {
	const property position = game.at(13,11)
	method image()= "PC.jpg"
	
}

object cama {
	const property position = game.at(7,7)
	method image() = "cama.jpg"
	
}

object cocina {
	const property position = game.at(3, 11)
	method image() = "cocina.jpg"
	
}

object salida {
	const property position = game.at(0, 5)
}

