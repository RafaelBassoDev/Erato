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

class MockData {
    static let chapters: [Chapter] = [
        .init(title: "Chapter 1", content: text, isRead: true),
        .init(title: "Chapter 2", content: text, isRead: true),
        .init(title: "Chapter 3", content: text, isRead: true),
        .init(title: "Chapter 4", content: text, isRead: true),
        .init(title: "Chapter 5", content: text, isRead: true),
        .init(title: "Chapter 6", content: text),
        .init(title: "Chapter 7", content: text),
        .init(title: "Chapter 8", content: text),
        .init(title: "Chapter 9", content: text),
    ]
    
    static var multiChapters: [Chapter] = {
        var tmpChapters: [Chapter] = []
        var lastCh: Chapter? = nil
        
        for i in 0...100 {
            let chapter = Chapter(title: "Chapter \(i)", content: text)
            
            lastCh?.next = chapter
            lastCh = chapter
            
            tmpChapters.append(chapter)
        }
        return tmpChapters
    }()
    
    static let novels: [Novel] = [
        .init(
            title: "Xian Ni",
            author: "Er Gen",
            description: "Some description",
            chapters: multiChapters),
        .init(
            title: "Tales of Demons and Gods",
            author: "Er Gen",
            description: "Some description",
            chapters: chapters),
        .init(
            title: "Sword God in a Magical World",
            author: "Er Gen",
            description: "Some description",
            chapters: chapters)
    ]
    
    static let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus efficitur vel nunc eget sollicitudin. Pellentesque condimentum velit quis est congue blandit. Cras sed velit ac mi ullamcorper auctor sit amet at est. Integer mauris lorem, congue sit amet volutpat a, finibus vel nisi. Pellentesque laoreet, arcu sit amet sollicitudin hendrerit, enim neque congue tellus, eu accumsan sem ex ut ipsum. Etiam vulputate ex eget tortor consequat lobortis. Nunc dignissim at nibh a sollicitudin. Sed quis pretium augue, sed ullamcorper leo. Donec laoreet in lacus ut accumsan. Donec vel nunc bibendum, pretium enim ac, malesuada augue. Mauris suscipit auctor vehicula. Integer sagittis nunc lectus, non lacinia enim molestie ac.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus."
}
