//
//  NovelDetailChapterList.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct NovelDetailChapterList: View {
    let chapters: [Chapter]
    
    var body: some View {
        ScrollViewReader { proxy in
            List(chapters, id: \.id) { chapter in
                NavigationLink {
                    ReadingScreen(chapter: chapter)
                } label: {
                    Text(chapter.title)
                }
                .foregroundStyle(chapter.isRead ? .secondary : .primary)
                .padding(.vertical)
                .id(chapter.title)
            }
            .listStyle(.plain)
            .onAppear {
                proxy.scrollTo("Chapter 1400")
            }
        }
    }
}

#Preview {
    NavigationStack {
        NovelDetailChapterList(chapters: MockData.chapters)
    }
}
