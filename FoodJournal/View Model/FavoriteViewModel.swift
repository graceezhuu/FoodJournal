//
//  FavoriteViewModel.swift
//  FoodJournal
//
//  Created by Grace Zhu on 2/7/23.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published private(set) var favorites: [Entry] = []

    init () {
        favorites = Entry.all
    }
    
    func addFavorite(entries: Entry) {
        favorites.append(entries)
    }
    
    func removeFavorite(entries: Entry) {
        favorites.removeAll(where: { $0 == entries })
    }
}
