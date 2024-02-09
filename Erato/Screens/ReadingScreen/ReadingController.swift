//
//  ReadingController.swift
//  Erato
//
//  Created by Rafael Basso on 07/02/24.
//

import SwiftUI
import Foundation

struct ReadingController: View {
    
    @EnvironmentObject var fontSettings: FontSettings
    
    @Environment(\.dismiss) private var dismiss
    
    @State var currentChapter: Chapter
    @State var isLoading = false
    
    @State var count = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("dismiss")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("settings")
                }
            }
            .padding(.horizontal)
//            Button {
//                print("settings")
//                
//            } label: {
//                Text("Settings")
//            }
//            .padding(.horizontal)
//            .frame(maxWidth: .infinity, alignment: .trailing)
            
            ReadingScreen(chapter: currentChapter)
        }
        .toolbar(.hidden, for: .navigationBar)
        .gesture(
            DragGesture(minimumDistance: 100)
                .onEnded { value in
                    UINavigationBar.setAnimationsEnabled(true)
                    
                    if value.startLocation.x > value.location.x {
                        // left <--X
                        currentChapter.IsRead()
                        
                        Task(priority: .userInitiated) {
                            if let nextChapter = try? await loadNextChapter() {
                                currentChapter = nextChapter
                            }
                        }
                    } else if value.startLocation.x < value.location.x {
                        // right X-->
                        dismiss()
                    }
                }
        )
        .loading(isLoading)
    }
}

extension ReadingController {
    private func loadNextChapter() async throws -> Chapter? {
        isLoading = true
        
        let nextChapter = await fetchNextChapter()
           
        isLoading = false
        
        return nextChapter
    }
    
    private func fetchNextChapter() async -> Chapter? {
        count += 1
        let nextChapter = MockData.chapters[count]
        return nextChapter
    }
}

#Preview {
    let chapter = MockData.chapters.first!
    let fontSettings = FontSettings()
    
    return ReadingController(currentChapter: chapter)
        .environmentObject(fontSettings)
}
