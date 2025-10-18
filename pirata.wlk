import armas.*

class Pirata {
  var property corajeBase
  const armas = []
  const inteligencia

  method coraje() = corajeBase + self.danioArmas()

  method danioArmas() = armas.sum{ arma => arma.danio(self) }

  method esHabilNegociador() = inteligencia > 50

  method modificarCorajeBase(cantidad) {
    corajeBase += cantidad
  }

  method degradar() {
    armas.clear()
    armas.add(new Espada(danio = 1))
  }
}
