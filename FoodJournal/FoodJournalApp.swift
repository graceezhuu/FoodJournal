//
//  FoodJournalApp.swift
//  FoodJournal
//
//  Created by Grace Zhu on 1/20/23.
//

import SwiftUI

@main
struct FoodJournalApp: App {
    @StateObject var journalViewModel = JournalViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(JournalViewModel())
        }
    }
}
