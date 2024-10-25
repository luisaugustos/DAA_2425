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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
