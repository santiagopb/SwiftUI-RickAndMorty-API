//
//  CharacterListCardView.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 4/2/23.
//

import SwiftUI
import Kingfisher

struct CharacterListCardView: View {
    var character: Character
    @State var presentCharacterDetail: Bool = false
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(spacing: 0) {
                KFImage(URL(string: character.image))
                    .placeholder { p in
                        ProgressView(p)
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading, spacing: 1) {
                    Text(character.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.ui.White)
                    HStack {
                        Circle()
                            .fill(character.statusColor)
                            .frame(width: 10, height: 10)
                        Text("\(character.status) - \(character.species)")
                            .fontWeight(.light)
                            .foregroundColor(Color.ui.White)
                        Spacer()
                    }
                    .padding(.bottom, 20)

                    Text(Localizable.CharacterKnownLocation.value)
                        .font(.subheadline)
                        .foregroundColor(Color.ui.WhiteSmock)
                    
                    Text(character.location.name ?? "")
                        .foregroundColor(Color.ui.White)
                        .padding(.bottom, 20)

                    Text(Localizable.CharacterFirstSeen.value)
                        .font(.subheadline)
                        .foregroundColor(Color.ui.WhiteSmock)
                    
                    Text(character.origin.name ?? "")
                        .foregroundColor(Color.ui.White)
                }
                .padding()
                Spacer(minLength: 0)
            }
            .background(Color.ui.Gray)
        }
        .fullScreenCover(isPresented: self.$presentCharacterDetail) {
            CharacterDetailView(id: character.id, title: character.name)
        }
        .onTapGesture {
            self.presentCharacterDetail.toggle()
        }
        .cornerRadius(8)
    }
    
}

#if DEBUG
struct CharacterListCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListCardView(character: Character(id: 1,
                                                   name: "Name",
                                                   status: "Status",
                                                   species: "Specie",
                                                   type: "Type",
                                                   gender: "Gender",
                                                   origin: CharacterLocation(name: "Close Rick-counters of the Rick Kind", url: ""),
                                                   location: CharacterLocation(name: "Citadel of Ricks", url: ""),
                                                   image: "https://rickandmortyapi.com/api/character/avatar/21.jpeg",
                                                   episode: ["Episode1"],
                                                   url: "Url",
                                                   created: "Created"))
    }
}
#endif
