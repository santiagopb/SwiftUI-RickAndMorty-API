//
//  CharacterFilterData.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 4/2/23.
//

import Foundation

class CharacterFilterData: Equatable {
    var name: String = ""
    var status: StatusEnum = .none
    var species: String = ""
    var type: String = ""
    var gender: GenderEnum = .none
    
    public static func ==(lhs: CharacterFilterData, rhs: CharacterFilterData) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.status == rhs.status &&
            lhs.species == rhs.species &&
            lhs.type == rhs.type &&
            lhs.gender == rhs.gender
    }
    
    convenience init (copyFrom: CharacterFilterData) {
        self.init()
        self.name =  copyFrom.name
        self.status = copyFrom.status
        self.species = copyFrom.species
        self.type = copyFrom.type
        self.gender = copyFrom.gender

    }
}

