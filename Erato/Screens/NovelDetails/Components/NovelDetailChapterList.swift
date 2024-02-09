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
                NavigationLink(chapter.title) {
                    ReadingController(currentChapter: chapter)
                }
                .foregroundStyle(chapter.isRead ? .secondary : .primary)
                .padding(.vertical)
                .id(chapter.title)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    NavigationStack {
        NovelDetailChapterList(chapters: MockData.chapters)
    }
}
