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
    let description: String
    let chapters: [Chapter]
    
    init(title: String, description: String, chapters: [Chapter]) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.chapters = chapters
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
