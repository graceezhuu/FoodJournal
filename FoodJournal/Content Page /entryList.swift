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

    
    var body: some View {
        
        VStack {
            List {
                ForEach(entriesVM.entrants.dropFirst(1)) { Entry in
                        cardView(card: Entry)
                        
                        NavigationLink(destination: entryView(entry: Entry)) {
                            Text("Open Journal Entry")
                        }
//                        .frame(width: 300, height: 10, alignment: .bottomTrailing)
//                        .gesture(
//                            TapGesture()
//                                .onEnded { _ in
//                                    isActive = true
//                                }
//                        )
                    }.listRowSeparator(.hidden)
                    .listRowSeparatorTint(.gray)
                }
            }
        }
    }
    
    struct entryList_Previews: PreviewProvider {
        static var previews: some View {
            entryList()
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
