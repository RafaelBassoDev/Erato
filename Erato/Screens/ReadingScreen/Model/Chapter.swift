//
//  Chapter.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import Foundation

struct Chapter {
    let id: UUID
    let title: String
    let content: String
    var isRead: Bool
    
    init(title: String, content: String, isRead: Bool = false) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.isRead = isRead
    }
}

extension Chapter: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        lhs.id == rhs.id
    }
}
