//
//  Facultad.swift
//  USAL
//
//  Created by Luis Augusto Silva on 3/10/24.
//

import Foundation
import SwiftUI
import CoreLocation


struct Facultad: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var city: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }


    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

/*
 "name": "Facultad de Filología",
 "category": "Humanidades",
 "city": "Salamanca",
 "id": 2001,
 "isFeatured": true,
 "isFavorite": true,
 "departments": [
     {
         "name": "Departamento de Lengua Española",
         "courses": ["Sintaxis", "Morfología", "Historia de la Lengua Española"]
     },
     {
         "name": "Departamento de Lenguas Modernas",
         "courses": ["Francés", "Inglés", "Alemán"]
     }
 ],
 "coordinates": {
     "longitude": -5.66928,
     "latitude": 40.96012
 }
 */
