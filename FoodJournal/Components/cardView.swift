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
    @State var isShowingPhotoPicker = false
    @State var cardImage = UIImage()
    
    var body: some View {
        let cardImage = UIImage(named: card.image)
        
        VStack(alignment: .leading) {
            
            Image(uiImage: cardImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 190)
                .clipShape(Rectangle())
                .onTapGesture {
                    isShowingPhotoPicker = true
                }
            Text(card.name)
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
                .buttonStyle(BorderlessButtonStyle())

                NavigationLink(destination: entryView(entry: card)) {
                }
            }
            .padding(.bottom)
            Button ("Delete", role: .destructive) {
                removeFromList()
                removeFavorite()
            }
            .buttonStyle(.borderless)
            .frame(maxWidth: 300, alignment: .center)
        }
        .sheet(isPresented: $isShowingPhotoPicker, content: {
            PhotoPicker(cardImage: $cardImage)
        })
    }
    func addFavorite() {        favoriteVM.addFavorite(entries: card)
    }
    func removeFavorite() {        favoriteVM.removeFavorite(entries: card)
    }
    func removeFromList() {
        entriesVM.removeEntry(entries: card)
    }
}



struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView(card: Entry.all[0], favOn: false)
            .environmentObject(JournalViewModel())
            .environmentObject(FavoriteViewModel())
    }
}



