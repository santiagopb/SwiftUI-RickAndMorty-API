//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import SwiftUI

extension CharacterListView {
    class ViewModel: ObservableObject {
        
        @Published var characterList: [Character] = []
        @Inject var service: RickAndMortyApiProtocol?
        @Published var isLoading: Bool = false
        var filterData = CharacterFilterData()
        var page: Int = 1
        internal var isLastPage: Bool = false
        
        init() {
            getCharacters()
        }
        
        // Obtenemos el listado de personajes paginado
        private func getCharacters() {
            guard !isLastPage else {
                Log.debug(tag: ViewModel.self, message: "We are on the last page we can not ask for more")
                return
            }
            
            self.isLoading = true
            
            //Hacemos la consulta desde el WS
            service?.getCharacters(page: page,
                                  name: filterData.name,
                                  status: filterData.status,
                                  species: filterData.species,
                                  type: filterData.type,
                                  gender: filterData.gender)?.responseDecodable(of: CharacterDataWrapperApiObject.self) { [weak self] response in

                switch response.result {
                case .success(let dataWrapper):
                    dataWrapper.results?.forEach({ character in
                        if let _character = Character.build(apiObject: character) {
                            self?.characterList.append(_character)
                        } else {
                            Log.error(tag: ViewModel.self, message: "It was not posible to build a Character from data -> \(character)")
                        }
                    })
                    self?.page += 1 //Sumamos 1 al paginador para que la proxima vez lea la siguiente página
                    self?.isLastPage = dataWrapper.info?.next == nil ? true : false //Revisamos si es la ultima página del listado
                case .failure(let error):
                    self?.isLastPage = true
                    Log.error(tag: ViewModel.self, message: "It was not posible to load Characters", error: error)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self?.isLoading = false
                }
            }

        }
        
        public func loadMore() {
            guard isLoading == false else { return }
            self.getCharacters()
        }
        
        
        public func applyFilter(_ filterData: CharacterFilterData) {
            if self.filterData == filterData {
                Log.debug(tag: ViewModel.self, message: "Filter values ​​have not changed")
            } else {
                self.filterData = filterData
                self.page = 1
                self.isLastPage = false
                self.characterList = []
                self.getCharacters()
            }
        }
    }
}
