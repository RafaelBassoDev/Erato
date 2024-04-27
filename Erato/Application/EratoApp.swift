//
//  EratoApp.swift
//  Erato
//
//  Created by Rafael Basso on 01/02/24.
//

import SwiftUI

@main
struct EratoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var fontSettings = FontSettings()
    @StateObject var novelCoordinator = NovelCoordinator(storage: LocalNovelStorage())
    
    @State var novels: [Novel] = []
    
    @State var isLoading = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                NovelCollection(novels: novels)
                    .loading(isLoading)
            }
            .environmentObject(fontSettings)
            .environmentObject(novelCoordinator)
            .task(priority: .userInitiated) {
                isLoading = true
                novels = await novelCoordinator.fetchNovels()
                isLoading = false
            }
        }
    }
}
