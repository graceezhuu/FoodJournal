//
//  CalendarView.swift
//  FoodJournal
//
//  Created by Grace Zhu on 1/27/23.
//  Chaudhari, R. (2022) Working with calendars in swift, LogRocket Blog. Available at: https://blog.logrocket.com/working-calendars-swift/ (Accessed: February 9, 2023)

import SwiftUI
import Foundation
import UIKit

struct CalendarView: View {
    var date = Text(Date.now, format: .dateTime.day().month().year())
    @State var selectedDate: Date = Date()
    @State var calendarSelectedDate: Date = Date()
    @State private var showingSheet = false
    
    
    var body: some View {
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
            DatePicker("Select Date", selection: $calendarSelectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.graphical)
                .onChange(of: calendarSelectedDate) { newValue in
                                    selectedDate = newValue
                                }
                .onTapGesture {
                        showingSheet.toggle()
                        print(showingSheet)
                }
                .sheet(isPresented: $showingSheet) {
                    HomeView()
                }
            
            Divider()
            Text("Today is \(formatDate)" )
        }
        .padding(.vertical, 100)

    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}


