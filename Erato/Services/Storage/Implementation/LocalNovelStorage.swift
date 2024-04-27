//
//  LocalNovelStorage.swift
//  Erato
//
//  Created by Rafael Basso on 27/04/24.
//

import Foundation

class LocalNovelStorage: NovelStorage {
    
    var cachedNovels: [Novel] = []
    
    func getStoredNovels() async -> [Novel] {
        var storedNovels = [Novel]()
        
        do {
            guard let path = Bundle.main.path(forResource: "battle_through_the_heavens", ofType: "json") else {
                throw NovelStorageError.readingFile
            }
            
            guard let fileData = try String(contentsOfFile: path, encoding: String.Encoding.utf8).data(using: .utf8) else {
                throw NovelStorageError.encodingData
            }
            
            storedNovels.append(try JSONDecoder().decode(Novel.self, from: fileData))
        } catch {
            print(error)
        }
        
        return storedNovels
    }
}
