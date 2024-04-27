//
//  NovelDetailChapterList.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct NovelDetailChapterList: View {
    @EnvironmentObject var novelCoordinator: NovelCoordinator
    
    @State var lastChapter: Chapter? = nil
    
    let chapters: [Chapter]
    
    var body: some View {
        ScrollViewReader { proxy in
            List(chapters, id: \.number) { chapter in
                NavigationLink(chapter.title) {
                    ReadingController(currentChapter: chapter)
                }
                .padding(.vertical)
                .id(chapter.number)
//                .foregroundStyle(lastChapter != nil && (lastChapter?.number == chapter.number) ? .secondary : .primary)
            }
            .listStyle(.plain)
            .onAppear {
                if let lastChapterNumber = lastChapter?.number {
                    proxy.scrollTo(lastChapterNumber)
                }
            }
        }
        .task {
            lastChapter = await novelCoordinator.getLastReadChapter()
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
