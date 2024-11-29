import SwiftData

@Model class Ciudad {
    var nombre: String
    var latitud: Double
    var longitud: Double
    var pronosticos: [Pronostico] = []

    init(nombre: String, latitud: Double, longitud: Double) {
        self.nombre = nombre
        self.latitud = latitud
        self.longitud = longitud
    }
}

@Model class Pronostico {
    var fecha: Date
    var temperatura: Double
    var probabilidadLluvia: Double

    init(fecha: Date, temperatura: Double, probabilidadLluvia: Double) {
        self.fecha = fecha
        self.temperatura = temperatura
        self.probabilidadLluvia = probabilidadLluvia
 