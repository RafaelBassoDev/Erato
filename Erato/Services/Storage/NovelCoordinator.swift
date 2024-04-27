//
//  NovelCoordinator.swift
//  Erato
//
//  Created by Rafael Basso on 27/04/24.
//

import Foundation

class NovelCoordinator: ObservableObject {
    let storage: NovelStorage
    
    var currentNovel: Novel? = nil
    var currentChapter: Chapter? = nil
    
    init(storage: NovelStorage) {
        self.storage = storage
    }
    
    deinit {
        currentNovel = nil
        currentChapter = nil
    }
}

extension NovelCoordinator {
    func fetchNovels() async -> [Novel] {
        return await storage.getStoredNovels()
    }
    
    func getLastReadChapter() async -> Chapter {
        // get last chapter from user defaults
        return Chapter(number: 10, title: "", content: "")
    }
}

extension NovelCoordinator {
    func getPreviousChapter() async -> Chapter? {
        guard let novel = currentNovel, let currentChapter else {
            return nil
        }
        
        return novel.chapters.first { chapter in
            chapter.number == currentChapter.number - 1
        }
    }
    
    func getNextChapter() async -> Chapter? {
        guard let novel = currentNovel, let currentChapter else {
            return nil
        }
        
        return novel.chapters.first { chapter in
            chapter.number == currentChapter.number + 1
        }
    }
}

extension NovelCoordinator {
    func setCurrentChapter(_ chapter: Chapter) {
        currentChapter = chapter
    }
    
    func setCurrentNovel(_ novel: Novel) {
        currentNovel = novel
    }
}
