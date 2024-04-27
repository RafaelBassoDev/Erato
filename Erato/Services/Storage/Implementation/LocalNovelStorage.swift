//
//  LocalNovelStorage.swift
//  Erato
//
//  Created by Rafael Basso on 27/04/24.
//

import Foundation

class LocalNovelStorage: NovelStorage {
    let userDefaults = UserDefaults.standard
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
    
    func setLastReadNovelAndChapter(novel: Novel, chapter: Chapter) {
        var values: [String: Int] = userDefaults.object(forKey: "lastReadNovelChapter") as? [String: Int] ?? [:]
        
        values[novel.title] = chapter.number
        
        userDefaults.set(values, forKey: "lastReadNovelChapter")
    }
    
    func getLastReadChapter(for novel: Novel) async -> Chapter? {
        let values: [String: Int] = userDefaults.object(forKey: "lastReadNovelChapter") as? [String: Int] ?? [:]
        
        guard let lastReadChapterNumber = values[novel.title] else {
            return nil
        }
        
        return novel.chapters.first { chapter in
            chapter.number == lastReadChapterNumber
        }
    }
}
