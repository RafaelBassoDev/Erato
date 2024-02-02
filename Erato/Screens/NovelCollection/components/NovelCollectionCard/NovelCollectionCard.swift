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
                .frame(maxWidth: maxHeight * 0.7)
            
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
        .navigationDestination(for: Novel.self) { novel in
            Text(novel.title)
                .navigationTitle(novel.title)
        }
    }
}

#Preview {
    let novel = Novel(title: "Sword God in a Magical World", author: "Er Gen", description: "Lorem ipsum dolor sit amet, amet sit dolor ipsum lorem ipsum dolor sit amet, lorem ipsum dolor sit amet. \nLorem ipsum dolor sit amet! Lorem dolor ipsum amet sit dolor.", chapters: [])
    return NovelCollectionCard(novel: novel, maxHeight: 150)
}
