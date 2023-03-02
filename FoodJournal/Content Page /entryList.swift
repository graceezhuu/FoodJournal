//
//  entryList.swift
//  FoodJournal
//
//  Created by Grace Zhu on 2/5/23.
//

import SwiftUI

struct entryList: View {
    @EnvironmentObject var entriesVM: JournalViewModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    @State private var isActive = false
    @State var card: Entry
    @State var filterList: [Entry] = []
    @State var displayDate = Date.now
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(entriesVM.entrants.dropFirst(1).filter {
                        Calendar.current.compare($0.date, to: displayDate, toGranularity: .day) == .orderedSame} ) { Entry in
                        Section {
                            cardView(card: Entry)
                                .listRowSeparator(.visible)
                        }
                    }
                }.listStyle(InsetGroupedListStyle())
            }
        }.navigationTitle(displayDate.formatted(date:.abbreviated, time:.omitted))
    }
}


struct entryList_Previews: PreviewProvider {
    static var previews: some View {
        entryList(card: Entry.all[0], displayDate:  Date.now)
            .environmentObject(JournalViewModel())
            .environmentObject(FavoriteViewModel())
    }
}

//                    NavigationLink( destination: entryView(entry: Entry)) {
//                        cardView(card: Entry)
//                    }
//                    ZStack {
//                        cardView(card: Entry)
//
//                        NavigationLink(destination: entryView(entry: Entry)) {
//                            EmptyView()
//                        }
//                        .frame(width: 20, height: 20, alignment: .topLeading)
//                    }
