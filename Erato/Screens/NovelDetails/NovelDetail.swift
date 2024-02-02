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
                Text("Aoba")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    let novel = Novel(title: "Sword God in a Magical World", author: "Er Gen", description: "Some DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description DescriptionSome DescriptionSome Description Description", chapters: [], isCompleted: false)
    return NovelDetail(novel: novel)
}
