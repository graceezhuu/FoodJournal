//
//  favoriteList.swift
//  FoodJournal
//
//  Created by Grace Zhu on 2/7/23.
//

import SwiftUI

struct favoriteList: View {
    @EnvironmentObject var entriesVM: JournalViewModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    @State private var isActive = false
    
    
    var body: some View {
        
        VStack {
            List {
                //                ForEach(favorites, id: \.self) { Entry in
                //                        cardView(card: Entry)
                //                    }
                //                }
                ForEach(favoriteVM.favorites.dropFirst(1)) { Entry in
                    cardView(card: Entry, favOn: true)
                    
                    NavigationLink(destination: entryView(entry: Entry)) {
                        Text("Open Journal Entry")
                    }
                }
            }
        }
    }
    
    struct favoriteList_Previews: PreviewProvider {
        static var previews: some View {
            favoriteList()
                .environmentObject(JournalViewModel())
                .environmentObject(FavoriteViewModel())
        }
    }
}
