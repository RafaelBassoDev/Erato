//
//  IconedButton.swift
//  Erato
//
//  Created by Rafael Basso on 24/04/24.
//

import SwiftUI

struct IconedButton: View {
    let systemName: String
    let isBold: Bool
    let action: () -> Void
    
    init(systemName: String, isBold: Bool = true, action: @escaping () -> Void) {
        self.systemName = systemName
        self.isBold = isBold
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .padding()
                .fontWeight(isBold ? .black : .regular)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 12))
    }
}

#Preview {
    HStack {
        IconedButton(systemName: "chevron.left") {
            print("clicked")
        }
        .tint(.blue)
        .controlSize(.mini)
        
        IconedButton(systemName: "list.dash") {
            print("clicked")
        }
        .tint(.blue)
        .controlSize(.small)
        
        IconedButton(systemName: "chevron.right") {
            print("clicked")
        }
        .tint(.blue)
        .controlSize(.large)
    }
}
