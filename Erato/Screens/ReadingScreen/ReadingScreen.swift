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
        ScrollView {
            VStack(spacing: 20) {
                Text(chapter.title)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(chapter.content)
                    .font(
                        .system(
                            size: fontSettings.size,
                            weight: .regular,
                            design: .rounded
                        )
                    )
                
                HStack {
                    IconedButton(systemName: "chevron.left") {
                        delegate?.didClickPrevious()
                    }
                    
                    IconedButton(systemName: "list.dash") {
                        delegate?.didClickChapterList()
                    }
                    
                    IconedButton(systemName: "chevron.right") {
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

#Preview {    
    let fontSettings = FontSettings()
    fontSettings.setSize(22)
    
    return ReadingScreen(chapter: MockData.chapters.first!, delegate: nil)
        .environmentObject(fontSettings)
}
