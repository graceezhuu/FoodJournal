//
//  addJournalEntry.swift
//  FoodJournal
//
//  Created by Grace Zhu on 2/3/23.
//

import SwiftUI
    

struct addJournalEntry: View {
    @EnvironmentObject var entriesVM: JournalViewModel
    @State private var name = ""
    @State private var cal = ""
    @State var type = ["Breakfast", "Lunch", "Dinner", "Dessert", "Snack", "Drink"]
    @State var selectedType = "Breakfast"
    @State var sliderValue : Double = 0.0
    @State var calorieVal = 0.0
    @State private var description = ""
    @Binding var isPresenting: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter Meal Name", text: $name)
                }
                Section(header: Text("Choose Meal Type")) {
                    Picker("Meal Type", selection: $selectedType){
                        ForEach(type, id: \.self) {
                            Text($0)
                        }
                    }
    
                }
                Section(header: Text("Calories")) {
                    VStack {
                            Slider(value: $calorieVal, in: 0...2000) {
                                Text("Slider")
                              
                            } minimumValueLabel: {
                                Text("0").font(.title2).fontWeight(.thin)
                            } maximumValueLabel: {
                                Text("2000").font(.title2).fontWeight(.thin)
                            }.tint(.blue)
                            Text("Caloric Value: \(Int(calorieVal))")
                            
                        }
                }

                Section(header: Text("Type your description here")) {
                    TextEditor(text: $description)
                                    .navigationTitle("Type your description here")
                    
                }
                HStack {
                            Spacer()
                            Button ("Add"){
                               saveEntry()
                                isPresenting = false
                            }
                            Spacer()
                        }
            }
            .navigationTitle("Journal Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button {
                    isPresenting = false
                } label : {
                    Text("Exit")
                    .foregroundColor(.red)
                }
            }
        } .navigationViewStyle(.stack)
    }
}


struct addJournalEntry_Previews: PreviewProvider {
    static var previews: some View {
        addJournalEntry(isPresenting: .constant(true))
        addJournalEntry(isPresenting: .constant(false))
    }
}

extension addJournalEntry {
    private func saveEntry() {
        let entry = Entry(name: name, image: selectedType, selectedType: selectedType, calories: calorieVal, description: description, isFavorite: entriesVM.favorite)
        entriesVM.addEntry(entries: entry)
    }
}
