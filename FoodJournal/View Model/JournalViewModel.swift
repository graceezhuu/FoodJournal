//
//  JournalViewModel.swift
//  FoodJournal
//
//  Created by Grace Zhu on 2/6/23.
//

import Foundation

class JournalViewModel: ObservableObject {
    @Published private(set) var entrants: [Entry] = []
    @Published var favorite = false

    var filteredItems: [Entry] {
           return entrants.filter { $0.isFavorite == true }
       }

    init () {
        entrants = Entry.all
    }
    
    func addEntry(entries: Entry) {
        entrants.append(entries)
    }
}
