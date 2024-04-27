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
                .id(chapter.number)
                .padding(.vertical)
                .foregroundStyle(lastChapter != nil && (chapter.number < lastChapter!.number) ? .secondary : .primary)
            }
            .listStyle(.plain)
            .onChange(of: lastChapter) {
                if let lastChapterNumber = lastChapter?.number {
                    withAnimation(.easeOut) {
                        proxy.scrollTo(lastChapterNumber, anchor: .center)
                    }
                }
            }
        }
        .task(priority: .userInitiated) {
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
