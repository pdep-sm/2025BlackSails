import blackSails.*


class Contienda {

  method validarToma(atacante, defensor) {
    if (not self.puedeTomar(atacante, defensor))
      throw new ContiendaException(message="No se puede realizar la contienda")
  }

  method puedeTomar(atacante, defensor)

  // 4.b
  method tomar(atacante, defensor) { // Template Method
    self.validarToma(atacante, defensor)
    self.realizarToma(atacante, defensor)
  }

  method realizarToma(atacante, defensor)
}
object batalla inherits Contienda {

  // 4.a
  override method puedeTomar(atacante, defensor) = atacante.danio() > defensor.danio()

  override method realizarToma(atacante, defensor) {
    atacante.modificarCorajeBase(5)
    defensor.eliminarCobardes(3)
    defensor.capitan(atacante.contramaestre())
    atacante.promoverNuevoContramaestre()
    atacante.migrarCorajudos(3, defensor)
  }

}


object negociacion inherits Contienda {

  // 4.a
  override method puedeTomar(atacante, defensor) = atacante.tieneHabilNegociador()

  override method realizarToma(atacante, defensor) {
    const mitadBotin = defensor.botin() / 2
    atacante.sumarBotin(mitadBotin)
    defensor.restarBotin(mitadBotin)
  }
}


class ContiendaException inherits DomainException {

}