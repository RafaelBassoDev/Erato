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
    @EnvironmentObject var novelCoordinator: NovelCoordinator
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
                .background(.background)
        }
        .toolbar(.hidden, for: .navigationBar)
        .loading(isLoading)
        .onAppear {
            novelCoordinator.setCurrentChapter(currentChapter)
        }
        .onChange(of: currentChapter) {
            novelCoordinator.setCurrentChapter(currentChapter)
        }
    }
    
    func didClickPrevious() {
        Task(priority: .userInitiated) {
            isLoading = true
            if let nextChapter = await novelCoordinator.getPreviousChapter() {
                currentChapter = nextChapter
            }
            isLoading = false
        }
    }
    
    func didClickNext() {
        Task(priority: .userInitiated) {
            isLoading = true
            if let nextChapter = await novelCoordinator.getNextChapter() {
                currentChapter = nextChapter
            }
            isLoading = false
        }
    }
    
    func didClickChapterList() {
        dismiss()
    }
}

#Preview {
    let chapter = MockData.chapters.first!
    let fontSettings = FontSettings()
    
    return ReadingController(currentChapter: chapter)
        .environmentObject(fontSettings)
}
