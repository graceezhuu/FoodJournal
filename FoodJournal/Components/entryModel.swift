//
//  entryModel.swift
//  FoodJournal
//
//  Created by Grace Zhu on 2/5/23.
//

import Foundation
import SwiftUI

enum Category: String {
    var id: String {self.rawValue}
    
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
    
}

protocol ImageOrUIImage { }

extension Int: ImageOrUIImage  { }
extension String: ImageOrUIImage  { }

struct Entry: Identifiable, Hashable {
    
    let id = UUID()
    let name: String
    var image: String
    let selectedType: Category.RawValue
    let calories: Double
    let description: String
    let date: Date
}

extension Entry {
    static var all: [Entry] = [
        Entry (name: "French Toast",
               image: "Breakfast",
               selectedType: "Breakfast",
               calories: 400.0,
               description: "French toast just has such a way of starting the morning off in the best way. Paired with a bowl of fresh berries, a few slices of bacon, and a drizzle of maple syrup, and a dollop of whipped cream make this a meal that is always a crowd favorite!",
               date: Date.now)
    ]
}
