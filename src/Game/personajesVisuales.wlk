import wollok.game.*

object personajePrincipal {
	var property position = game.origin()
	var estadoEmocional = 100
	
	method image() = "juan.jpg"
	method saludo() = "Hola! :D"
	method humor(){
		if(estadoEmocional >= 70)
			return "feliz.jpg"
		if(estadoEmocional >= 30 && estadoEmocional < 70)
			return "neutral.jpg"
		if(estadoEmocional >= 0 && estadoEmocional <30)
			return "triste.jpg"
		return "muerto.jpg"
	}
	method disminuirHumor(){
		estadoEmocional -=5
	}
}
