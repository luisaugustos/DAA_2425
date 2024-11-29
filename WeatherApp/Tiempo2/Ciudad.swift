//
//  Item.swift
//  Tiempo2
//
//  Created by alumno on 22/11/24.
//

import Foundation
import SwiftData

@Model class Ciudad {
    var nombre: String
    var latitud: Double
    var longitud: Double
    var prognosticos: [Prognostico] = []
    
    init(nombre: String, latitud: Double, longitud: Double) {
        self.nombre = nombre
        self.latitud = latitud
        self.longitud = longitud
    }
}

@Model class Prognostico {
    var fecha: Date
    var temp: Double
    var probabilidadLluvia: Double
    
    init(fecha: Date, temp: Double, probabilidadLluvia: Double) {
        self.fecha = fecha
        self.temp = temp
        self.probabilidadLluvia = probabilidadLluvia
    }
}


