//
//  AppShortCutPracticeApp.swift
//  AppShortCutPractice
//
//

import SwiftUI
import SwiftData

@main
struct AppShortCutPracticeApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(OrderDataStore.shared.container)
    }
}
