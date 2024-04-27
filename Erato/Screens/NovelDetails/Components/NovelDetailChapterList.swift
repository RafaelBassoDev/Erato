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
            List(chapters, id: \.number) { chapter in
                NavigationLink(chapter.title) {
                    ReadingController(currentChapter: chapter)
                }
                .padding(.vertical)
                .id(chapter.number)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    let fontSettings = FontSettings()
    
    return NavigationStack {
        NovelDetailChapterList(chapters: MockData.chapters)
    }
    .environmentObject(fontSettings)
}
