//
//  tabView.swift
//  FoodJournal
//
//  Created by Grace Zhu on 1/27/23.
//

import SwiftUI


struct tabView: View {
    @State var selectedTab = 1
    
    var body: some View {
        TabView (selection: $selectedTab){
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
        }
    }
}

struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        tabView()
            .environmentObject(JournalViewModel())
            .environmentObject(FavoriteViewModel())

    }
}
