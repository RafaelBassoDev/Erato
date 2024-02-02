//
//  Novel.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import Foundation

struct Novel {
    let id: UUID
    let title: String
    let author: String
    let description: String
    let chapters: [Chapter]
    
    let isCompleted: Bool
    let chapterCount: Int
    
    init(title: String, author: String, description: String, chapters: [Chapter], isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.author = author
        self.description = description
        self.chapters = chapters
        self.isCompleted = isCompleted
        
        self.chapterCount = chapters.count
    }
}

extension Novel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Novel, rhs: Novel) -> Bool {
        lhs.id == rhs.id
    }
}
