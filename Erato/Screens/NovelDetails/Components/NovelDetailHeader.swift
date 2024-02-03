//
//  NovelDetailHeader.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct NovelDetailHeader: View {
    let novel: Novel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(novel.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontWidth(.condensed)
                
                Text(novel.author)
                    .font(.subheadline)
                
                HStack {
                    IconedText(text: String(novel.chapterCount), systemName: "book.pages")
                 
                    Text("|")
                        .foregroundStyle(.secondary)
                    
                    Text(novel.isCompleted ? "Completed" : "Incomplete")
                        .foregroundStyle(novel.isCompleted ? .green : .red)
                }
                .font(.footnote)
            }
            
            Spacer()
            
            Rectangle()
                .fill(.red)
                .frame(maxWidth: 130, maxHeight: 180)
        }
    }
}

#Preview {
    NovelDetailHeader(novel: MockData.novels.first!)
}
