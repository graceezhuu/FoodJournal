//
//  CalendarView.swift
//  toolbarCalendarView
//
//  Created by Grace Zhu on 1/27/23.
//  Chaudhari, R. (2022) Working with calendars in swift, LogRocket Blog. Available at: https://blog.logrocket.com/working-calendars-swift/ (Accessed: February 9, 2023)

import SwiftUI
import Foundation
import UIKit

struct toolbarCalendarView: View {
    @EnvironmentObject var entriesVM: JournalViewModel
    var date = Text(Date.now, format: .dateTime.day().month().year())
    @State var selectedDate: Date = Date()
    @State var calendarSelectedDate: Date = Date()
    @State private var showingSheet = false
    @State var showSheet: Bool = false
    @State var showCal: Bool = false

    
    var body: some View {
//        var filteredItems: [entriesVM] {
//                if searchText.isEmpty {
//                    return entriesVM.entrants[0]
//                } else {
//                    return entriesVM.entrants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
//                }
//        }
        
        let formatDate = selectedDate.formatted(date:.abbreviated, time:.omitted)
        
        VStack() {
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .font(.system(size: 28))
                .bold()
                .foregroundColor(Color.accentColor)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
            
                
            Divider().frame(height: 1)
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.graphical)
                .onChange(of: selectedDate) { _ in
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    NavigationView {
                        entryList(card: entriesVM.entrants[0], displayDate: selectedDate)
                            .toolbar {
                                Button {
                                    showSheet = true
                                } label: {
                                    Image(systemName: "plus")
                                } .sheet(isPresented: $showSheet) {
                                    addJournalEntry(isPresenting: $showSheet, date: selectedDate)
                                }
                            }
                    }
                }
            
            Divider()
            Text("You have selected \(formatDate)" )
        }
        .padding(.vertical, 100)

    }
}

struct toolbarCalendarView_Preview: PreviewProvider {
    static var previews: some View {
        toolbarCalendarView()
            .environmentObject(JournalViewModel())
    }
}


