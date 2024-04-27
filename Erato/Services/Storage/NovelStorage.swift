//
//  NovelStorage.swift
//  Erato
//
//  Created by Rafael Basso on 27/04/24.
//

import Foundation

protocol NovelStorage {
    func getStoredNovels() async -> [Novel]
}

enum NovelStorageError: Error {
    case readingFile, encodingData, decodingJSON
}
