//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 4/2/23.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm =  CharacterDetailViewModel()
    @State var showDetailInfo: Bool = true
    var id: Int
    var title: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.ui.Primary
                    .overlay(
                        KFImage(URL(string: vm.character?.image ?? ""))
                            .placeholder { p in
                                ProgressView(p)
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minHeight: 0, maxHeight: .infinity)
                            .overlay(
                                Color.ui.Primary.opacity(showDetailInfo ? 0.4 : 0)
                            )
                    )
                if let character = vm.character, showDetailInfo == true {
                    ScrollView {
                        VStack {
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
                            .background(Color.ui.Primary.opacity(0.8))
                            .cornerRadius(8)
                        }
                        .padding()
                    }
                    
                }

            }
            .ignoresSafeArea(.all, edges: [.bottom, .leading, .trailing] )
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarItems(leading:
                                    Image(systemName: "chevron.left")
                .foregroundColor(Color.ui.Orange)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
                                , trailing: Image(systemName: showDetailInfo ? "eye" : "eyebrow")
                .foregroundColor(Color.ui.Orange)
                .onTapGesture {
                    self.showDetailInfo.toggle()
                }
            )
        }
        .statusBar(hidden: true)
        .onAppear {
            vm.viewIsReady(id: id)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(id: 1, title: "Titulo")
    }
}
