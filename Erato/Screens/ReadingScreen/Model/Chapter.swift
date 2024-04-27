//
//  Chapter.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import Foundation

class Chapter: Decodable {
    let number: Int
    let title: String
    let content: String
    
    init(number: Int, title: String, content: String) {
        self.number = number
        self.title = title
        self.content = content
    }
}

extension Chapter {
    func getFormattedContent() -> String {
        content.split(whereSeparator: \.isNewline).joined(separator: "\n\n")
    }
}

extension Chapter: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        lhs.number == rhs.number
    }
}
