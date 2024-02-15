//
//  Tag.swift
//  Erato
//
//  Created by Rafael Basso on 09/02/24.
//

import SwiftUI

struct Tag: View {
    let name: String
    
    var color: Color {
        return [
            Color.red,
            Color.blue,
            Color.purple,
            Color.green,
            Color.orange,
            Color.indigo,
            Color.mint,
            Color.brown,
        ].randomElement()!
    }
    
    var body: some View {
        Text(name)
            .font(.system(.footnote, weight: .semibold))
            .padding(.horizontal, 13)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
            )
    }
}

#Preview {
    Tag(name: "Xianxia")
}
