
class Entrada {
  const property banda
  const property fecha // formato aaddaaaa
  const precio_base = 1000
  var property impuestoProductora

  method precioAlPublico () = precio_base * impuestoProductora
}

class Asistente {
  const abono
  const property historial = []
  var property dinero
  var dtoXAbono //en porcentaje

  method comprarEntrada (entrada) {
    if (dinero > 0) {
      dinero -= entrada.precioAlPublico()*(1 - dtoXAbono/100)
      historial.add(entrada)
    }
  }
  method entradasDeAñoAnterior () {
    return historial.filter({ent => ent.fecha()%10000 == new Date().year()-1})
  }
  method nombreDeBandas () {
    return historial.map({ent => ent.banda()}).distinct()
  }

  method esVip () = abono == "vip"

  method bonificar () {
    if (self.esVip()){
      dtoXAbono += 1
    }
  }

  method gananciaTotal () = historial.map({ent => ent.precioAlPublico()}).sum()

  method cantidadDeEntradas () = historial.size()
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
  const property bandas = #{}

  method todasLasEntradas () = 
    asistentes.flatMap({a=>a.historial()})

  method presupuestoDeTodasLasEntradas () = 
    asistentes.flatMap({a=>a.nombreDeBandas()}).distinct().sum({unaBanda=>unaBanda.presupuesto()})

  method entradasVendidas (unaBanda) = 
    self.todasLasEntradas().count({ent=>ent.banda()==unaBanda})

  method gananciaTotal () = (asistentes.map({a=>a.gananciaTotal()}).sum())- self.presupuestoDeTodasLasEntradas()

  method cantidadDeEntradasVendidas () = asistentes.map({a=>a.cantidadDeEntradas()}).sum()

  method bandaMasPopular () = 
    bandas.max({unaBanda=>self.entradasVendidas(unaBanda)})

  method bonificarVips () {
    asistentes.forEach({a => a.bonificar()})
  }
}