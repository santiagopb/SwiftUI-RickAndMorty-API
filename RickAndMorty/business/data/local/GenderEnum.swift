//
//  GenderEnum.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 4/2/23.
//

import Foundation

public enum GenderEnum: String, CaseIterable, Identifiable {
    case none = ""
    case female = "female"
    case male = "male"
    case genderless = "genderless"
    case unknown = "unknown"
    
    public var id: String { self.rawValue }
}

extension GenderEnum {
    var value: String {
        get {
            if self == .none { return "none".localizedString() }
            return self.rawValue.localizedString()
        }
    }
}
