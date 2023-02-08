//
//  cardView.swift
//  FoodJournal
//
//  Created by Grace Zhu on 2/3/23.
//

import SwiftUI


struct cardView: View {
    @EnvironmentObject var entriesVM: JournalViewModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    
    
    @State var card: Entry
    @State var favOn = false
    @State private var isButtonActive = false
    @State private var selection: String? = nil
    
    
    var body: some View {
        //        var addFavorite = favoriteVM.addFavorite(entries: card)
        
        VStack(alignment: .leading) {
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 190)
                .clipShape(Rectangle())
            HStack {
                Text(card.name)
            }
            HStack {
                Text(card.selectedType)
                    .foregroundColor(.gray)
                Button {
                    favOn.toggle()
                    if favOn == true{
                        addFavorite()
                    } else {
                        removeFavorite()
                    }
                } label: {
                    if favOn == true {
                        Image(systemName: "star.fill")
                            .foregroundColor(.blue)
                    }
                    else {
                        Image(systemName: "star")
                            .foregroundColor(.blue)
                    }
                }
//                NavigationLink(destination: entryView(entry: card), tag: "Second", selection: $selection) { EmptyView() }
                Button("Tap to show second") {
                    self.selection = "Second"
                }
                
                //                NavigationLink(destination: entryView(entry: card)) {
                //                    Text("Click Me")
                //                }
            }
        }
    }
    func addFavorite() {        favoriteVM.addFavorite(entries: card)
    }
    func removeFavorite() {        favoriteVM.removeFavorite(entries: card)
    }
}



struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView(card: Entry.all[0], favOn: false)
            .environmentObject(JournalViewModel())
            .environmentObject(FavoriteViewModel())
    }
}



