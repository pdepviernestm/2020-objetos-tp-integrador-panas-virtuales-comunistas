import wollok.game.*
import juanTamagochi.*
import mapas.*
import personajesVisuales.*
import objetos.*
import stats.*

class Pizza {
    stats.modificarEnergia(-5)
    stats.modificarHumor(10)
    stats.modificarHambre(100)
    stats.modificarHigiene(-5)	
	stats.modificarSalud(-5)
}

class JojaCola {
	stats.modificarEnergia(10)
    stats.modificarHumor(10)
    stats.modificarHambre(10)
    stats.modificarHigiene(-5)
    stats.modificarSalud(-5)		
}

class ComidaBarata {
	stats.modificarEnergia(-5)
    stats.modificarHumor(-5)
    stats.modificarHambre(50)
    stats.modificarHigiene(-5)	
	stats.modificarSalud(-10)
}

class Fruta {
	stats.modificarEnergia(-5)
    stats.modificarHumor(-5)
    stats.modificarHambre(50)
    stats.modificarHigiene(-5)	
	stats.modificarSalud(10)	
}