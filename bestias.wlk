import blackSails.*

class BallenaAzul {
  const property fuerza

  method atacar(barco) {
    barco.envejecerCaniones(8)
  }
}

class TiburonBlanco {
  const cantidadMiedo
  const property fuerza

  method atacar(barco) {
    barco.modificarCorajeBase(-cantidadMiedo)
  }

}

object kraken {
  const property fuerza = 100000

  method atacar(barco) {
    barco.eliminarMasCorajudos(5)
  }
}