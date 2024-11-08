//
//  Item.swift
//  EjemploPhotos
//
//  Created by Luis Augusto Silva on 8/11/24.
//

import Foundation
import SwiftData

@Model
final class Item {

    @Attribute(.unique) var id: UUID
    var timestamp: Date
    var name: String
    var imageData: Data?

    init(name: String, imageData: Data?) {
        self.id = UUID()
        self.name = name
        self.imageData = imageData
        self.timestamp = Date()
    }
    
}
