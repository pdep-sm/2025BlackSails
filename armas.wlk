import pirata.*

/* Toda arma de un pirata debe responder al mensaje danio(pirata) */

object cuchillo {
  var property danio

  method danio(pirata) = danio
}

class Espada {
  const danio

  method danio(pirata) = danio
}

class Pistola {
  const calibre
  const nombreMaterial

  method danio(pirata) = calibre * material.indice(nombreMaterial)
}

object material {
  method indice(nombreMaterial) = 5 // Cada nombre de material devolvería algo distinto
}

class Insulto {
  const frase = "Mira detrás de tí, un mono de tres cabezas"

  method danio(pirata) = self.cantidadDePalabras() * pirata.corajeBase()
  method cantidadDePalabras() = frase.words().size()
}

/* Es un arma propia del barco, no necesita el pirata para calcular su daño */
class Canion {  
  method danio() // TODO - ¡¡No lo completamos!!
}

