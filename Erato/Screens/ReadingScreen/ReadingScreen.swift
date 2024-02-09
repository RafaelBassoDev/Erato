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
            }
            .padding(.horizontal)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {    
    let fontSettings = FontSettings()
    fontSettings.setSize(22)
    
    return ReadingScreen(chapter: MockData.chapters.first!)
        .environmentObject(fontSettings)
}
