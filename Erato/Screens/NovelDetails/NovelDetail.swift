//
//  NovelDetails.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct NovelDetail: View {
    @EnvironmentObject var novelCoordinator: NovelCoordinator
    
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
            novelCoordinator.setCurrentNovel(novel)
        }
    }
}

#Preview {
    NovelDetail(novel: MockData.novels.first!)
}
