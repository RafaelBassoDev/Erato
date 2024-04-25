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
    
    @State var count = 0
    
    var body: some View {
        ReadingScreen(chapter: currentChapter, delegate: self)
            .toolbar(.hidden, for: .navigationBar)
            .gesture(
                TapGesture(count: 3)
                    .onEnded {
                        print("three taps ended")
                    }
            )
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
        currentChapter.IsRead()
        
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
        
        count += 1
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        guard count < MockData.chapters.count else {
            return nil
        }
        
        return MockData.chapters[count]
    }
    
    private func loadPreviousChapter() async throws -> Chapter? {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        count -= 1
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        guard count < MockData.chapters.count else {
            return nil
        }
        
        return MockData.chapters[count]
    }
}

#Preview {
    let chapter = MockData.chapters.first!
    let fontSettings = FontSettings()
    
    return ReadingController(currentChapter: chapter)
        .environmentObject(fontSettings)
}
