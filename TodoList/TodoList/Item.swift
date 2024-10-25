//
//  Item.swift
//  TodoList
//
//  Created by Luis Augusto Silva on 25/10/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var id: UUID = UUID()
    var text: String
    var isFavorited: Bool = false
    var timestamp: Date
    
    init(description: String, timestamp: Date) {
        self.text = description
        self.timestamp = timestamp
    }
}
