//
//  NovelCollection.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

struct NovelCollection: View {
    let novels: [Novel]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(novels, id: \.self) { novel in
                        NavigationLink(value: novel) {
                            NovelCollectionCard(novel: novel, maxHeight: proxy.size.height * 0.2)
                        }
                        .padding(.horizontal)
                        .buttonStyle(.plain)
                    }
                }
            }
            
        }
        .navigationTitle("Novels")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    var novels: [Novel] = []
    for _ in 1...5 {
        let novel = Novel(title: "Sword God in a Magical World", description: "Some DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome Description", chapters: [])
        novels.append(novel)
    }
    return NavigationStack {
        NovelCollection(novels: novels)
    }
}
