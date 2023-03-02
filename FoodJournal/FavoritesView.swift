//
//  FavoritesView.swift
//  FoodJournal
//
//  Created by Grace Zhu on 1/27/23.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var entriesVM: JournalViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                favoriteList()
            }
            .navigationTitle("All-Time Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(JournalViewModel())
            .environmentObject(FavoriteViewModel())

    }
}
