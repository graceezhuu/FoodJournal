//
//  ContentView.swift
//  FoodJournal
//
//  Created by Grace Zhu on 1/20/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            tabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(JournalViewModel())
            .environmentObject(FavoriteViewModel())

    }
}
