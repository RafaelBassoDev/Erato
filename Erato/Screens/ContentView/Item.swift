//
//  Item.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
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
