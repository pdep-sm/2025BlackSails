import armas.*

class Pirata {
  var property corajeBase
  const armas = []

  method coraje() = corajeBase + self.danioArmas()

  method danioArmas() = armas.sum{ arma => arma.danio(self) }
}
