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
                        NavigationLink {
                            NovelDetail(novel: novel)
                        } label: {
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
    NavigationStack {
        NovelCollection(novels: MockData.novels)
    }
}
