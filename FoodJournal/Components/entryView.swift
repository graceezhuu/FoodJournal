//
//  entryView.swift
//  FoodJournal
//
//  Created by Grace Zhu on 2/7/23.
//

import SwiftUI

struct entryView: View {
    var entry: Entry
    @Binding var cardImage: UIImage

    var body: some View {
        let formatDate = entry.date.formatted(date:.abbreviated, time:.omitted)
        
        ScrollView {
            Image(uiImage: cardImage)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(height:300)
                .frame(maxWidth:.infinity, maxHeight: .infinity)
            
            VStack (spacing: 10) {
                Text(entry.name)
                    .font(.largeTitle)
                    .bold()
                    .padding([.top, .leading, .trailing])
                    .frame(width: 400)
                    .multilineTextAlignment(.center)
                Text("Date: " + formatDate)
                Text("Calories: " + String(entry.calories))

                VStack (alignment: .leading, spacing: 30){
                    Text(entry.description)
                        .padding([.top, .leading, .trailing])
                        .frame(width: 400)
                }
            }
        } .ignoresSafeArea()
    
    }
}

struct entryView_Previews: PreviewProvider {
    @State static var selectedImage = UIImage()

    static var previews: some View {
        entryView(entry: Entry.all[0], cardImage: $selectedImage)
    }
}
