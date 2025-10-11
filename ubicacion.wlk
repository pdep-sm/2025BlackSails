class Ubicacion { // Objeto inmutable: La ubicación no cambia, el barco cambia de ubicación.
  const property oceano
  const property x
  const property y

  method enDistanciaDeConflictoCon(ubicacion) =
    oceano == ubicacion.oceano() and
    self.distanciaA(ubicacion) < ubicacion.distanciaMaximaDeConflicto()

  method distanciaA(ubicacion) = 
    ((self.x() - ubicacion.x()).square() + (self.y() - ubicacion.y()).square()).squareRoot()
}

object ubicacion { // Companion
  var property distanciaMaximaDeConflicto = 100
}