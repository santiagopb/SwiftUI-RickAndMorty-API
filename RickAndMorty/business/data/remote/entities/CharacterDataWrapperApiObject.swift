//
//  CharacterDataWrapperApiObject.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import Foundation

struct CharacterDataWrapperApiObject: Codable {
    var info: CharacterInfoApiObject?
    var results: [CharacterApiObject]?
}
