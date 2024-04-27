//
//  ReadingScreen.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

struct ReadingScreen: View {
    @EnvironmentObject var fontSettings: FontSettings
    
    @Environment(\.dismiss) private var dismiss
    
    let chapter: Chapter
    
    let delegate: ReadingScreenDelegate?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(chapter.title)
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .id("title")
                        .padding(.bottom)
                    
                    Text(chapter.getFormattedContent())
                        .applyingFontSettings(fontSettings)
                        .padding(.bottom)
                    
                    HStack {
                        IconedButton(systemName: "chevron.left") {
                            withAnimation { proxy.scrollTo("title") }
                            delegate?.didClickPrevious()
                        }
                        
                        IconedButton(systemName: "return") {
                            delegate?.didClickChapterList()
                        }
                        
                        IconedButton(systemName: "chevron.right") {
                            withAnimation { proxy.scrollTo("title") }
                            delegate?.didClickNext()
                        }
                    }
                    .tint(.blue)
                    .controlSize(.mini)
                    .padding(.top)
                }
                .padding(.horizontal)
                .padding(.bottom, 300)
            }
            .gesture(
                DragGesture(minimumDistance: 100, coordinateSpace: .local)
                    .onEnded { proxy in
                        if proxy.translation.width > 0 {
                            dismiss()
                        }
                    }
            )
        }
    }
}

#Preview {    
    let fontSettings = FontSettings()
    
    return ReadingScreen(chapter: MockData.chapters.first!, delegate: nil)
        .environmentObject(fontSettings)
}
