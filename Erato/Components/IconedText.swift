//
//  IconedText.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct IconedText: View {
    let text: String
    let systemName: String
    
    init(text: String, systemName: String) {
        self.text = text
        self.systemName = systemName
    }
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: systemName)
            Text(text)
        }
    }
}

#Preview {
    IconedText(text: "810", systemName: "book.pages")
}
