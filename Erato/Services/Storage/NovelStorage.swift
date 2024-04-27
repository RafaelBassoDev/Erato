//
//  NovelStorage.swift
//  Erato
//
//  Created by Rafael Basso on 27/04/24.
//

import Foundation

protocol NovelStorage {
    func getStoredNovels() async -> [Novel]
    func setLastReadNovelAndChapter(novel: Novel, chapter: Chapter)
    func getLastReadChapter(for novel: Novel) async -> Chapter?
}

enum NovelStorageError: Error {
    case readingFile, encodingData, decodingJSON
}
