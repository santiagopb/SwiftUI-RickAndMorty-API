//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 4/2/23.
//

import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    
    @Published var character: Character?
    @Inject var service: RickAndMortyApi

    func viewIsReady(id: Int) {
        service.getCharacter(id: id)?.responseDecodable(of: CharacterApiObject.self) { [weak self] response in
            switch response.result {
            case .success(let character):
                if let _character = Character.build(apiObject: character) {
                    self?.character = _character
                } else {
                    Log.error(tag: CharacterDetailViewModel.self, message: "It was not posible to build a Character from data -> \(character)")
                }
            case .failure(let error):
                Log.error(tag: CharacterDetailViewModel.self, message: "It was not posible to load Characters", error: error)
            }
        }
    }
    
}