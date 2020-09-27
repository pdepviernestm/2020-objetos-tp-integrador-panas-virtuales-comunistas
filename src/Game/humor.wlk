import personajesVisuales.*
import wollok.game.*

object humorDePersonaje {
	const property position = game.at(14,14)
	const protagonista = personajePrincipal
	method image()=protagonista.humor()
}
