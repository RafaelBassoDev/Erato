//
//  NovelCollectionCard.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

struct NovelCollectionCard: View {
    let novel: Novel
    let maxHeight: CGFloat
        
    var body: some View {
        HStack(alignment: .top) {
            Rectangle()
                .fill(Color.red)
                .frame(maxWidth: maxHeight * 0.7, maxHeight: .infinity)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(novel.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontWidth(.condensed)
                
                Text(novel.description)
                    .font(.subheadline)
            }
            .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, maxHeight: maxHeight, alignment: .leading)
    }
}

#Preview {
    NovelCollectionCard(novel: MockData.novels.first!, maxHeight: 200)
}
