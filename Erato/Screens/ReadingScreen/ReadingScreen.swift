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
                VStack(spacing: 20) {
                    Text(chapter.title)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .id("title")
                    
                    Text(chapter.content)
                        .applyingFontSettings(fontSettings)
                    
                    HStack {
                        IconedButton(systemName: "chevron.left") {
                            withAnimation { proxy.scrollTo("title") }
                            delegate?.didClickPrevious()
                        }
                        
                        IconedButton(systemName: "list.dash") {
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
            }
        }
    }
}

#Preview {    
    let fontSettings = FontSettings()
    
    return ReadingScreen(chapter: MockData.chapters.first!, delegate: nil)
        .environmentObject(fontSettings)
}
