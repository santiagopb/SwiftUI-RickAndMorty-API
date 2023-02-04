//
//  CharacterApiObject.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import Foundation

struct CharacterApiObject: Codable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: CharacterLocationApiObject?
    var location: CharacterLocationApiObject?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

