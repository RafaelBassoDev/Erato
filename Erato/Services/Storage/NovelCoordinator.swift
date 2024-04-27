//
//  NovelCoordinator.swift
//  Erato
//
//  Created by Rafael Basso on 27/04/24.
//

import Foundation

class NovelCoordinator {
    let storage: NovelStorage
    
    init(storage: NovelStorage) {
        self.storage = storage
    }
    
    func fetchNovels() async -> [Novel] {
        return await storage.getStoredNovels()
    }
    
    // set current novel
    // set current chapter
}
