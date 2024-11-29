//
//  Item.swift
//  CryptoTracker
//
//  Created by Luis Augusto Silva on 19/11/24.
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
