import personajesVisuales.*
import wollok.game.*

object saludDePersonaje {
	const property position = game.at(14,13)
	const protagonista = personajePrincipal
	method image() = protagonista.salud()
}

