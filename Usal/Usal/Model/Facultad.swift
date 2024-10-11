//
//  Facultad.swift
//  Usal
//
//  Created by alumno on 4/10/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Facultad: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var city: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D { CLLocationCoordinate2D(
        latitude: coordinates.latitude,
        longitude: coordinates.longitude)
    }
    
    struct Coordinates: Codable, Hashable {
        var latitude: Double
        var longitude: Double
    }
}
