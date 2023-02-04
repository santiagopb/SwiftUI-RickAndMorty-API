//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var vm = CharacterListViewModel()
    @State var presentFilters: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.ui.Primary
                List {
                    ForEach(vm.characterList) { character in
                        CharacterListCardView(character: character)
                            .padding(.bottom)
                    }
                    .listRowBackground(Color.ui.Primary)

                    if vm.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                            .listRowBackground(Color.ui.Primary)
                    } else if vm.characterList.count == 0 {
                        VStack {
                            HStack {
                                Spacer()
                                LottieView(filename: LottieFile.SEARCH_NOT_FOUND)
                                    .frame(width: 200, height: 200)
                                    .transition(AnyTransition.scale.animation(.easeInOut(duration: 1.0)))
                                    .background(Color.ui.Primary)
                                Spacer()
                            }
                            Text(Localizable.SearchNotFount.value)
                                .foregroundColor(Color.ui.White)
                        }
                        .frame(height: UIScreen.main.bounds.height)
                        .listRowBackground(Color.ui.Primary)
                    } else {
                        Color.ui.Primary
                            .onAppear{
                                vm.loadMore()
                            }
                            .listRowBackground(Color.ui.Primary)
                    }
                    
                    
                    
                }
                .listStyle(.plain)
                .background(Color.ui.White)
                
            }
            .ignoresSafeArea(.all, edges: [.bottom, .leading, .trailing] )
            .navigationBarTitle(Localizable.ApplicationTitle.value, displayMode: .inline)
            .navigationBarItems(trailing:
                                    Image(systemName: "slider.horizontal.3")
                .foregroundColor(Color.ui.Orange)
                .sheet(isPresented: self.$presentFilters) {
                    CharacterListFilterView(filterData: CharacterFilterData(copyFrom: vm.filterData)) { newData in
                        vm.applyFilter(newData)
                    }
                }
                .onTapGesture {
                    self.presentFilters.toggle()
                }
            )

        }
        .navigationViewStyle(StackNavigationViewStyle())
        .statusBar(hidden: true)
    }
    
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
