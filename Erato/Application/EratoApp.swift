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
    
    @State var novels: [Novel] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                NovelCollection(novels: novels)
            }
            .environmentObject(fontSettings)
            .onAppear {
                novels = MockData.novels;
            }
        }
    }
}
