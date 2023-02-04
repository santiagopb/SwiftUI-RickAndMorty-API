//
//  Localizable.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import SwiftUI

enum Localizable: String {
    case ApplicationTitle,
         CharacterKnownLocation,
         CharacterFirstSeen,
         CharacterFilter,
         CharacterName,
         CharacterStatus,
         CharacterSpecies,
         CharacterType,
         CharacterGender,
         CharacterFilterApply,
         CharacterFilterRemove,
         SearchNotFount
}


extension Localizable {
    var value: String {
        get {
            return self.rawValue.localizedString()
        }
    }
}
