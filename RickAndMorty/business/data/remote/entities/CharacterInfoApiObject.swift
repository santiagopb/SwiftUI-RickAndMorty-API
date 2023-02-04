//
//  CharacterInfoApiObject.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import Foundation

struct CharacterInfoApiObject: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
}
