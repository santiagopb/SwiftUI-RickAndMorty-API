//
//  MockGenerator.swift
//  RickAndMorty_Tests
//
//  Created by Santiago Pereira on 5/2/23.
//

import Foundation

@testable import RickAndMorty
struct MockGenerator {
    
    static func characterApiObject(id: Int?) -> CharacterApiObject {
        let origin = CharacterLocationApiObject(name: "Origin name",
                                                url: "Origin url")
        let location = CharacterLocationApiObject(name: "Location name",
                                                  url: "Location url")
        return CharacterApiObject(id: id,
                                  name: "Name",
                                  status: "Status",
                                  species: "Species",
                                  type: "Type",
                                  gender: "Gender",
                                  origin: origin,
                                  location: location,
                                  image: "Image",
                                  episode: ["Episode 1"],
                                  url: "Url",
                                  created: "Created")
    }
    
    static func characterDataWrapperApiObject() -> CharacterDataWrapperApiObject {
        let info = CharacterInfoApiObject(count: 8,
                                          pages: 1,
                                          next: "Next",
                                          prev: "Prev")
        return CharacterDataWrapperApiObject(info: info,
                                             results: [characterApiObject(id: 1)])
    }
}
