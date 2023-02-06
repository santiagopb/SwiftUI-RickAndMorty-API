//
//  Character.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import SwiftUI

struct Character: Identifiable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: CharacterLocation
    var location: CharacterLocation
    var image: String
    var episode: [String]
    var url: String
    var created: String
    
    static func build(apiObject: CharacterApiObject) -> Character? {
        guard let id = apiObject.id else { return nil }
        
        return Character(id: id,
                         name: apiObject.name ?? "",
                         status: apiObject.status ?? "",
                         species: apiObject.species ?? "",
                         type: apiObject.type ?? "",
                         gender: apiObject.gender ?? "",
                         origin: CharacterLocation.build(apiObject: apiObject.origin),
                         location: CharacterLocation.build(apiObject: apiObject.location),
                         image: apiObject.image ?? "",
                         episode: apiObject.episode ?? [],
                         url: apiObject.url ?? "",
                         created: apiObject.created ?? "")

    }
}

extension Character {
    var statusColor: Color {
        switch status.lowercased() {
        case StatusEnum.alive.rawValue: return Color.ui.Green
        case StatusEnum.dead.rawValue: return Color.ui.Red
        default: return Color.ui.WhiteSmock
        }
    }
}


#if DEBUG
var MockCharacter: Character {
    return Character(id: 1,
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
                     created: "Created")
}
#endif
