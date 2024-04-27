//
//  NovelCollectionCard.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

struct NovelCollectionCard: View {
    let novel: Novel
    let cardHeight: CGFloat
    let showTags: Bool
    
    init(novel: Novel, cardHeight: CGFloat, showTags: Bool = true) {
        self.novel = novel
        self.cardHeight = cardHeight
        self.showTags = showTags
    }
        
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(novel.coverUrl ?? "image_not_found", bundle: .main)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 195, alignment: .center)
                .clipped()
            
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text(novel.title)
                        .font(.title)
                    
                    Text(novel.author)
                        .font(.title3)
                }
                .fontWeight(.semibold)
                .fontWidth(.condensed)
                
                if showTags {
                    Text(novel.tags.joined(separator: ", "))
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.secondary)
                                .opacity(0.4)
                        )
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    NovelCollectionCard(novel: MockData.novels[2], cardHeight: 200)
}
