
class Entrada {
  const banda

  
  const fecha // formato aaddaaaa
  const precio_base = 1000
  var property impuestoProductora

  method precioAlPublico () = precio_base * impuestoProductora
}

class Asistente {
  const abono
  const property historial = {}
  var property dinero
  const dtoXAbono //en porcentaje

  method comprarEntrada (entrada) {
    if (dinero > 0) {
      dinero -= entrada.precioAlPublico()*(1 - dtoXAbono/100)
      historial.add(entrada)
    }
  }
  method entradasDeAñoAnterior () {
    historial.filter({ent => ent.fecha()%10000 == new Date().year()-1})
}
  method nombreDeBandas () {
    historial.map({ent => ent.banda()})
  }
}

class Banda {
  const nombre
  var canon = 1000000
  
  method gastoExtra ()
  method presupuesto () = canon + self.gastoExtra()
  method popularidad ()
}

class BandaDeRock inherits Banda (){
  const solosDeGuitarra

  override method gastoExtra () = 10000
  override method popularidad () = 100 * solosDeGuitarra

}

class BandaDeTrap inherits Banda (){
  const tienenHielo

  override method popularidad (){
    if (tienenHielo){
      canon = 1000000000
      return 1000
    }
    else {
      canon = 0
      return 0
    }
    }
}

class BandaIndie inherits Banda (){
  const cantidadIntrumentos

  override method gastoExtra () = 500 * cantidadIntrumentos
  override method popularidad () = 3.14 * nombre.length()

}

object productora {
  const asistentes = #{}
  const listaDeEntradasDeUnAsistente = {asistente => asistente.historial()}

  method gananciaTotal () {
    return asistentes.map(listaDeEntradasDeUnAsistente.map({entrada => entrada.precioAlPublico()})).sum()
  }

  method cantidadDeEntradasVendidas () {
    return asistentes.map(listaDeEntradasDeUnAsistente).size()
  }
// APLANAR LAS LISTAS PARA QUE QUEDE UNA SOLA
  method bandaMasPopular () {}
}