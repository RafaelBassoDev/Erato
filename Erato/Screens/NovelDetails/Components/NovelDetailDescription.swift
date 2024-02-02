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
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    let description = "Some DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description"
    return NovelDetailDescription(description: description)
}
