//
//  CalendarView.swift
//  FoodJournal
//
//  Created by Grace Zhu on 1/27/23.
//

import SwiftUI
import Foundation
import UIKit

struct CalendarView: View {
    var date = Text(Date.now, format: .dateTime.day().month().year())
    @State var selectedDate: Date = Date()
    
    
    var body: some View {
//        Text("Today is \(date)" )
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
            Divider()
        }
        .padding(.vertical, 100)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
