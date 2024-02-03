//
//  NovelDetailDescription.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct NovelDetailDescription: View {
    let description: String
    
    var body: some View {
        ScrollView {
            Text(description)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }
}

#Preview {
    NovelDetailDescription(description: MockData.novels.first!.description)
}
