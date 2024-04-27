//
//  NovelStorage.swift
//  Erato
//
//  Created by Rafael Basso on 27/04/24.
//

import Foundation

class NovelStorage {
    
    var cachedNovels: [Novel] = []
    
    func getStoredNovels() -> [Novel] {
        return []
    }
}

class NovelCoordinator {
    let storage: NovelStorage
    
    init(storage: NovelStorage) {
        self.storage = storage
    }
    
    // set current novel
    // set current chapter
}
