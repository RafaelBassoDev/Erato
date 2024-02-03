//
//  File.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

final class FontSettings: ObservableObject {
    @Published private(set) var size: CGFloat = 32
    
    public func setSize(_ newSize: CGFloat) {
        size = newSize
    }
}
