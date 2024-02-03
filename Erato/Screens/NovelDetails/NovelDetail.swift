//
//  NovelDetails.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct NovelDetail: View {
    @State var currentSubMenu: String = "Description"
    
    let novel: Novel
    
    var body: some View {
        VStack(spacing: 0) {
            NovelDetailHeader(novel: novel)
                .padding()
            
            TabMenuBar(options: ["Description", "Chapters"]) { option in
                currentSubMenu = option
            }
            
            if (currentSubMenu == "Description") {
                NovelDetailDescription(description: novel.description)
                    .padding(.bottom)
            } else {
                NovelDetailChapterList(chapters: novel.chapters)
            }
        }
        .onAppear {
            UINavigationBar.setAnimationsEnabled(true)
        }
    }
}

#Preview {
    NovelDetail(novel: MockData.novels.first!)
}
