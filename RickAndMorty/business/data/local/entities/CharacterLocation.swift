//
//  CharacterLocation.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 4/2/23.
//

import SwiftUI

struct CharacterLocation {
    var name: String?
    var url: String?
    
    static func build(apiObject: CharacterLocationApiObject?) -> CharacterLocation {
        return CharacterLocation(name: apiObject?.name ?? "",
                                 url: apiObject?.url ?? "")
    }
}
