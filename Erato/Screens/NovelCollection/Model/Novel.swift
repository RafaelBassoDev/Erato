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
    let tags: [String]
    let coverUrl: String?
    
    let chapterCount: Int
    let chapters: [Chapter]
    
    let isCompleted: Bool
    
    init(title: String, author: String, description: String, tags: [String] = [], chapters: [Chapter], isCompleted: Bool = false, coverUrl: String? = nil) {
        self.id = UUID()
        self.title = title
        self.author = author
        self.description = description
        self.tags = tags
        self.coverUrl = coverUrl
        self.chapters = chapters
        self.chapterCount = chapters.count
        self.isCompleted = isCompleted
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
        .init(number: 1, title: "Chapter 1", content: text),
        .init(number: 2, title: "Chapter 2", content: text),
        .init(number: 3, title: "Chapter 3", content: text),
        .init(number: 4, title: "Chapter 4", content: text),
        .init(number: 5, title: "Chapter 5", content: text),
        .init(number: 6, title: "Chapter 6", content: text),
        .init(number: 7, title: "Chapter 7", content: text),
        .init(number: 8, title: "Chapter 8", content: text),
        .init(number: 9, title: "Chapter 9", content: text),
        
    ]
    
    static var multiChapters: [Chapter] = {
        var tmpChapters: [Chapter] = []
        
        for i in 1...100 {
            let chapter = Chapter(number: i, title: "Chapter \(i)", content: text)
            
            tmpChapters.append(chapter)
        }
        return tmpChapters
    }()
    
    static let novels: [Novel] = [
        .init(
            title: "Xian Ni",
            author: "Er Gen",
            description: text,
            tags: ["Weak to Strong", "Martial Arts", "Fantasy", "Xianxia"],
            chapters: multiChapters),
        .init(
            title: "Tales of Demons and Gods",
            author: "Er Gen",
            description: "Some description",
            tags: ["Reincarnation", "Pills", "Action"],
            chapters: chapters,
            coverUrl: "btth_cover"),
        .init(
            title: "Battle Through the Heavens",
            author: "天蚕土豆",
            description: text,
            tags: ["Fantasy", "Action", "Martial arts", "Adventure", "Comedy", "Harem", "Xuanhuan"],
            chapters: chapters,
            coverUrl: "btth_cover"),
    ]
    
    static let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus efficitur vel nunc eget sollicitudin. Pellentesque condimentum velit quis est congue blandit. Cras sed velit ac mi ullamcorper auctor sit amet at est. Integer mauris lorem, congue sit amet volutpat a, finibus vel nisi. Pellentesque laoreet, arcu sit amet sollicitudin hendrerit, enim neque congue tellus, eu accumsan sem ex ut ipsum. Etiam vulputate ex eget tortor consequat lobortis. Nunc dignissim at nibh a sollicitudin. Sed quis pretium augue, sed ullamcorper leo. Donec laoreet in lacus ut accumsan. Donec vel nunc bibendum, pretium enim ac, malesuada augue. Mauris suscipit auctor vehicula. Integer sagittis nunc lectus, non lacinia enim molestie ac.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus.\n\n Mauris vitae leo id lorem accumsan interdum. Duis aliquam, dui non sodales viverra, risus mi volutpat turpis, suscipit tempor nisi tortor volutpat nunc. Mauris nec consequat justo, imperdiet varius felis. Maecenas ullamcorper convallis metus, vel vulputate mi pulvinar vitae. Nunc vitae ipsum feugiat, suscipit orci sed, tempus dui. Sed pharetra eros a enim porta, vitae commodo felis tempor. Etiam ut orci sollicitudin eros faucibus eleifend vel vel tortor. Sed iaculis dolor vel ligula maximus, id finibus neque blandit. Nam eu eleifend lectus."
}
