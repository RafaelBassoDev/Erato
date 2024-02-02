//
//  NovelDetails.swift
//  Erato
//
//  Created by Rafael Basso on 02/02/24.
//

import SwiftUI

struct NovelDetail: View {
    let novel: Novel
    
    var body: some View {
        VStack(spacing: 0) {
            NovelDetailHeader(novel: novel)
                .padding()
            
            TabMenuBar(options: ["Description", "Chapters"]) { option in
                print(option)
            }
            
            Rectangle()
                .fill(.purple)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    let novel = Novel(title: "Sword God in a Magical World", author: "Er Gen", description: "Some DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome DescriptionSome Description", chapters: [], isCompleted: false)
    return NovelDetail(novel: novel)
}
