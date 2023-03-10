//
//  HomeView.swift
//  FoodJournal
//
//  Created by Grace Zhu on 1/27/23.
//

import SwiftUI



struct HomeView: View {
    @State var showSheet: Bool = false
    @State var showCal: Bool = false
    @EnvironmentObject var entriesVM: JournalViewModel
    
    var body: some View {
        let size = entriesVM.entrants.filter {
            Calendar.current.compare($0.date, to: Date.now, toGranularity: .day) == .orderedSame}.count
        let showDate = entriesVM.entrants[0].date
        let formatDate = showDate.formatted(date:.abbreviated, time:.omitted)
        

        
        NavigationView {
            VStack {
                if (size - 1 <= 0) {
                    Image("dog-sit")
                        .resizable()
                        .frame(width:100, height:100)
                    Text("Wow such empty")
                        .padding()

                }
                else {
                    entryList(card: entriesVM.entrants[0])
                        .navigationTitle(formatDate)

                }
            }
            .navigationTitle(formatDate)
            .toolbar {
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus")
                } .sheet(isPresented: $showSheet) {
                    addJournalEntry(isPresenting: $showSheet)
                }
                Button {
                    showCal = true
                }label: {
                    Image(systemName: "calendar")
                }.sheet(isPresented: $showCal) {
                    toolbarCalendarView()
                }
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(JournalViewModel())
            .environmentObject(FavoriteViewModel())
        
    }
}

//                cardView().padding(.horizontal, 8)
