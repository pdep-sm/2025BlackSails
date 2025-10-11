import pirata.*
import armas.*
import ubicacion.*

class Barco {
  /* Para los puntos realizados, no hace falta que capitan y contramaestre sean properties todavía */
  var capitan
  var contramaestre
  const property tripulacion = #{}  // Cada tripulante debería ser un objeto distinto
  const property caniones = []      // Una lista me permite agregar muchas veces el mismo cañón
  var property ubicacion            // El barco puede cambiar de ubicación

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
    self.tripulacion() == otro.tripulacion() and self.caniones() == otro.caniones()
}
