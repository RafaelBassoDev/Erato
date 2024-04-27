//
//  ReadingController.swift
//  Erato
//
//  Created by Rafael Basso on 07/02/24.
//

import SwiftUI
import Foundation

struct ReadingController: View, ReadingScreenDelegate {
    @EnvironmentObject var fontSettings: FontSettings
    @Environment(\.dismiss) private var dismiss
    
    @State var currentChapter: Chapter
    
    @State var isLoading = false
    @State var showSettings = false
    
    var body: some View {
        SettingsSheet(showSettings: $showSettings) {
            ReadingScreen(chapter: currentChapter, delegate: self)
                .gesture(
                    TapGesture(count: 3)
                        .onEnded {
                            showSettings = true
                        }
                )
        }
        .toolbar(.hidden, for: .navigationBar)
        .loading(isLoading)
    }
    
    func didClickPrevious() {
        Task(priority: .userInitiated) {
            if let nextChapter = try? await loadPreviousChapter() {
                currentChapter = nextChapter
            }
        }
    }
    
    func didClickNext() {
        Task(priority: .userInitiated) {
            if let nextChapter = try? await loadNextChapter() {
                currentChapter = nextChapter
            }
        }
    }
    
    func didClickChapterList() {
        dismiss()
    }
}

extension ReadingController {
    private func loadNextChapter() async throws -> Chapter? {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
//        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        let nextChapterNumber = currentChapter.number + 1
        
        guard nextChapterNumber <= MockData.chapters.count else {
            return nil
        }
        
        return MockData.chapters[nextChapterNumber-1]
    }
    
    private func loadPreviousChapter() async throws -> Chapter? {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
//        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        let nextChapterNumber = currentChapter.number - 1
        
        guard nextChapterNumber >= 1 else {
            return nil
        }
        
        return MockData.chapters[nextChapterNumber-1]
    }
}

#Preview {
    let chapter = MockData.chapters.first!
    let fontSettings = FontSettings()
    
    return ReadingController(currentChapter: chapter)
        .environmentObject(fontSettings)
}
