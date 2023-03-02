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
        var cardImage = UIImage(named: card.image)

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
        .onAppear {
            print("cardImage: \(cardImage)")
        }

    }
    func addFavorite() {        favoriteVM.addFavorite(entries: card)
    }
    func removeFavorite() {        favoriteVM.removeFavorite(entries: card)
    }
    func removeFromList() {
        entriesVM.removeEntry(entries: card)
    }
    func setImage(image: UIImage) {
        card.image = image.toPngString()!
    }
}



struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView(card: Entry.all[0], favOn: false)
            .environmentObject(JournalViewModel())
            .environmentObject(FavoriteViewModel())
    }
}

extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
  
    func toJpegString(compressionQuality cq: CGFloat) -> String? {
        let data = self.jpegData(compressionQuality: cq)
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}

