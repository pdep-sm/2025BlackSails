import pirata.*
import armas.*
import ubicacion.*

class Barco {
  /* Para los puntos realizados, no hace falta que capitan y contramaestre sean properties todavía */
  var property capitan
  var property contramaestre
  const property tripulacion = #{}  // Cada tripulante debería ser un objeto distinto
  const property caniones = []      // Una lista me permite agregar muchas veces el mismo cañón
  var property ubicacion            // El barco puede cambiar de ubicación
  var botin

  // 1. Calcular el poder de daño de una embarcación.
  method danio() =
    self.corajeTotal() + self.danioCaniones()

  method corajeTotal() = self.tripulacionTotal().sum{ tripulante => tripulante.coraje() }

  method tripulacionTotal() = tripulacion.union(#{capitan, contramaestre})

  method danioCaniones() = caniones.sum{ canion => canion.danio() }

  // 2. Obtener al tripulante más corajudo de la embarcación (que no es capitán, ni contramaestre).
  method masCorajudo() = tripulacion.max{ tripulante => tripulante.coraje() }

  // 3. Saber si 2 embarcaciones pueden entrar en conflicto
  method puedeEntrarEnConflictoCon(barco) = ubicacion.enDistanciaDeConflictoCon(barco.ubicacion())

  // ejemplo de implementación de igualdad customizada, no es parte del ejercicio
  override method ==(otro) = 
    self.tripulacionTotal() == otro.tripulacionTotal() and self.caniones() == otro.caniones()

  method puedeTomar(barco, contienda) = contienda.puedeTomar(self, barco)

  method tieneHabilNegociador() = self.tripulacionTotal().any{ pirata => pirata.esHabilNegociador() }

  method eliminarCobardes(cantidad) {
    const cobardes = self.tripulacionPorMayorCoraje().reverse().take(cantidad)
    tripulacion.removeAll(cobardes)
  }

  method tripulacionPorMayorCoraje() = 
    tripulacion.sortedBy{ p1, p2 => p1.coraje() > p2.coraje() }

  method promoverNuevoContramaestre() {
    contramaestre = self.masCorajudo()
    tripulacion.remove(contramaestre)
  }

  method migrarCorajudos(cantidad, barco) {
    const corajudos = self.tripulacionPorMayorCoraje().take(cantidad)
    barco.agregarTripulacion(corajudos)
    tripulacion.removeAll(corajudos)
  }

  method agregarTripulacion(piratas) {
    tripulacion.addAll(piratas)
  }

  method sumarBotin(cantidad) {
    botin += cantidad
  } 

  method restarBotin(cantidad) {
    botin -= cantidad
  } 

  // 5
  method generarMotin() {
    const contramaestreAnterior = contramaestre
    self.promoverNuevoContramaestre()
    if (contramaestreAnterior.coraje() > capitan.coraje()) {
      capitan = contramaestreAnterior
    } else {
      contramaestreAnterior.degradar()
      tripulacion.add(contramaestreAnterior)
    }
  }

  // 7
  method cruzarseCon(bestia) {
    if (bestia.fuerza() > self.danio()) {
      bestia.atacar(self)
    }
  }

  method envejecerCaniones(anios) {
    caniones.forEach{ canion => canion.envejecer(anios) }
  }

  method modificarCorajeBase(cantidad) {
    self.tripulacionTotal().forEach { 
      pirata => pirata.modificarCorajeBase(cantidad) 
    }
  }

  method eliminarMasCorajudos(cantidad) {
    const corajudos = self.tripulacionPorMayorCoraje().take(cantidad)
    tripulacion.removeAll(corajudos)
  }
}
